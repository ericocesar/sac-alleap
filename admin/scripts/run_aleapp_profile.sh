#!/bin/bash
# Run ALEAPP over one extraction with one profile.
#
# Reads ORIGEM, DESTINO and PROFILE from an env file (default docs/paths.env),
# checks them, and prints what it is about to do before starting. ALEAPP is slow
# on a large archive, so the log path is printed up front.
#
#   admin/scripts/run_aleapp_profile.sh [env-file]
#
# Any of ORIGEM, DESTINO or PROFILE already exported wins over the file, so a
# one-off run needs no file:
#
#   PROFILE=zProfile03Comunicacoes.alprofile admin/scripts/run_aleapp_profile.sh
#
# Exit status: 0 the run finished, 1 a precondition failed or ALEAPP exited
# non-zero, 2 usage error.
#
# Written for the bash 3.2 that ships with macOS: no ${var,,}, no associative
# arrays, no printf -v with a computed name.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../.." && pwd)"
readonly SCRIPT_DIR REPO_ROOT
ENV_FILE="${1:-${REPO_ROOT}/docs/paths.env}"
readonly ENV_FILE

die() { printf 'erro: %s\n' "$*" >&2; exit 1; }
usage() { sed -n '2,17p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 2; }

case "${1:-}" in -h|--help) usage ;; esac

trim() {
    local s="$1"
    s="${s#"${s%%[![:space:]]*}"}"
    s="${s%"${s##*[![:space:]]}"}"
    printf '%s' "${s}"
}

# --- env file ---------------------------------------------------------------
# Read as data, never sourced: a path may hold spaces, parentheses or a dollar,
# and nothing in the file may run a command.
FROM_FILE_ORIGEM=''
FROM_FILE_DESTINO=''
FROM_FILE_PROFILE=''
if [[ -f "${ENV_FILE}" ]]; then
    while IFS='=' read -r raw_key raw_value || [[ -n "${raw_key}" ]]; do
        key="$(trim "${raw_key}")"
        value="$(trim "${raw_value}")"
        [[ -z "${key}" || "${key}" == \#* ]] && continue
        case "${key}" in
            ORIGEM)  FROM_FILE_ORIGEM="${value}" ;;
            DESTINO) FROM_FILE_DESTINO="${value}" ;;
            PROFILE) FROM_FILE_PROFILE="${value}" ;;
            *) printf 'aviso: %s ignorado (só ORIGEM, DESTINO e PROFILE são lidos)\n' "${key}" >&2 ;;
        esac
    done < "${ENV_FILE}"
else
    printf 'aviso: env file não encontrado: %s\n' "${ENV_FILE}" >&2
fi

# An exported value wins over the file.
ORIGEM="${ORIGEM:-${FROM_FILE_ORIGEM}}"
DESTINO="${DESTINO:-${FROM_FILE_DESTINO}}"
PROFILE="${PROFILE:-${FROM_FILE_PROFILE}}"

[[ -n "${ORIGEM}" ]]  || die "ORIGEM não definida (nem no ambiente, nem em ${ENV_FILE})"
[[ -n "${DESTINO}" ]] || die "DESTINO não definida (nem no ambiente, nem em ${ENV_FILE})"
[[ -n "${PROFILE}" ]] || die "PROFILE não definida (nem no ambiente, nem em ${ENV_FILE})"

# --- profile ----------------------------------------------------------------
# A profile selects artifacts by exact name and silently skips names it cannot
# find, so resolve it here rather than let the run produce fewer tables.
resolve_profile() {
    local p="$1" candidate
    case "${p}" in
        /*) printf '%s' "${p}"; return ;;
    esac
    for candidate in "${REPO_ROOT}/${p}" "${REPO_ROOT}/docs/${p}"; do
        if [[ -f "${candidate}" ]]; then printf '%s' "${candidate}"; return; fi
    done
    printf '%s' "${p}"
}
PROFILE_PATH="$(resolve_profile "${PROFILE}")"

[[ -f "${ORIGEM}" ]]  || die "ORIGEM não é um arquivo: ${ORIGEM}"
[[ -d "${DESTINO}" ]] || die "DESTINO não é uma pasta existente: ${DESTINO}"
[[ -f "${PROFILE_PATH}" ]] || die "PROFILE não encontrado: ${PROFILE} (procurado em ${REPO_ROOT} e ${REPO_ROOT}/docs)"

# --- interpreter ------------------------------------------------------------
if [[ -x "${REPO_ROOT}/venv/bin/python" ]]; then
    PY="${REPO_ROOT}/venv/bin/python"
elif command -v python3 >/dev/null 2>&1; then
    PY="$(command -v python3)"
else
    die "nenhum python3 encontrado"
fi

# --- input type -------------------------------------------------------------
# ALEAPP needs -t and does not infer it. Match on the lowercased name without
# ${var,,}, which bash 3.2 does not have.
lower="$(printf '%s' "${ORIGEM}" | tr '[:upper:]' '[:lower:]')"
case "${lower}" in
    *.zip)                          TYPE=zip ;;
    *.tar|*.tar.gz|*.tgz)           TYPE=tar ;;
    *.gz)                           TYPE=gz ;;
    *.img|*.dd|*.bin|*.e01|*.ex01|*.aff|*.dmg|*.vhd|*.vhdx|*.vmdk|*.qcow2)
                                    TYPE=raw ;;
    *) die "não sei o tipo de ORIGEM; ajuste o case em ${BASH_SOURCE[0]}" ;;
esac

# --- run --------------------------------------------------------------------
printf 'origem   : %s\n' "${ORIGEM}"
printf 'destino  : %s\n' "${DESTINO}"
printf 'profile  : %s\n' "${PROFILE_PATH}"
printf 'tipo     : %s\n' "${TYPE}"
printf 'python   : %s\n' "${PY}"
printf 'log      : %s\n\n' "${DESTINO}/aleapp_run.log"

cd -- "${REPO_ROOT}"
# Merge the streams, keep a copy, and keep ALEAPP's own exit status.
set +e
"${PY}" aleapp.py -t "${TYPE}" -i "${ORIGEM}" -o "${DESTINO}" -m "${PROFILE_PATH}" 2>&1 \
    | tee "${DESTINO}/aleapp_run.log"
status="${PIPESTATUS[0]}"
set -e

if (( status == 0 )); then
    printf '\nconcluído. saída em %s\n' "${DESTINO}"
else
    printf '\nALEAPP terminou com status %d; log em %s\n' "${status}" "${DESTINO}/aleapp_run.log" >&2
fi
exit "${status}"
