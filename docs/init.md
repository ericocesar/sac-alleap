# Install (Python 3.11+)
# IMPORTANTE (macOS): use o Python do python.org, não o do Homebrew.
# O Homebrew python@3.14 não inclui _tkinter; o python.org inclui.
# Baixe em https://www.python.org/downloads/mac-osx/
/usr/local/bin/python3.14 -m venv venv
source venv/bin/activate          # Windows: venv\Scripts\activate
pip install -r requirements.txt

# Para a cadeia exata de dependências com que as releases são construídas
# (sem a linha do mister_skinnylegs):
#   python3 admin/scripts/install_requirements.py

# O venv guarda caminhos absolutos: activate e os shebangs de venv/bin apontam
# para a pasta onde ele foi criado. Se o repositorio for movido, recrie o venv
# (rm -rf venv) antes de usar de novo, senao pip falha com "bad interpreter".

# Exec
# Cli: -t aceita fs, tar, zip, gz, raw
# A pasta de output precisa existir antes de rodar.
python aleapp.py -t <fs | tar | zip | gz | raw> -i <path_to_extraction> -o <path_for_report_output>
python aleapp.py --help

# gui
python aleappGUI.py

## macOS GUI troubleshooting

If `python aleappGUI.py` raises `ModuleNotFoundError: _tkinter`, install a macOS Python distribution that includes Tcl/Tk (for example, the official python.org installer for your Python version) or install `tcl-tk` through Homebrew before reinstalling Homebrew Python so `_tkinter` is built.

```
brew install tcl-tk
brew reinstall python@3.14
```

Afterwards run `python3 -m tkinter` to confirm Tk support and recreate the virtual environment if needed so the GUI starts successfully.

# Compile
# Um driver, um spec (packaging/aleapp.spec) e UM executavel, `aleapp`: sem
# argumento ele abre a janela, com argumento e a CLI. Nao existe spec separado
# para a GUI, e os specs antigos em scripts/pyinstaller/ nao existem mais.
python packaging/build.py exe                # dist/ALEAPP/ (e dist/ALEAPP.app no macOS)
python packaging/build.py exe --onefile      # dist/aleapp, um arquivo so
python packaging/build.py smoke              # roda o que a fase 1 construiu, sem abrir janela
python packaging/build.py installer          # .exe (Windows), .dmg (macOS), .AppImage (Linux)
python packaging/build.py all                # as duas fases, sem assinatura
python packaging/build.py verify <path>      # confere a assinatura
