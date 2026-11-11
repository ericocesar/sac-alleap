# Módulos ALEAPP por perfil de análise

Gerado a partir do loader real (`scripts/plugin_loader.py`) em 2026-11-11.

**1542 artefatos** em **18 perfis**. Toda categoria do repositório está coberta; 0 artefatos ficaram sem perfil.

O ALEAPP não tem o conceito de “perfil”: ele organiza por `category`, que é por app. Os perfis abaixo são agrupamentos temáticos das categorias, para rodar a extração em etapas.

## Como usar

O ALEAPP seleciona artefatos por **nome de chave** (a chave do dicionário `__artifacts_v2__`,
por exemplo `get_browserCachechrome`), não pelo nome de exibição nem pela categoria.

### GUI

O campo *Filter* casa contra `categoria + nome de exibição`. Como um perfil reúne várias categorias,
filtre categoria por categoria, marcando **Select All** em cada uma. Desmarque as caixas lentas
à mão antes de executar.

### CLI com profile (.alprofile)

`aleapp -m arquivo.alprofile` lê um JSON no formato de `zProfileExample.alprofile`:

```json
{"leapp": "aleapp", "format_version": 1, "plugins": ["get_calllogs", "get_calllog"]}
```
Também é possível gerar o profile a partir de uma seleção da GUI. Use a coluna de chave abaixo
para montar a lista. Chave errada é silenciosa: o artefato simplesmente não roda
(ver `admin/test/scripts/test_profile_artifact_names.py`).

## Resumo

| # | Perfil | Artefatos | Riscos |
|---|---|---|---|
| 01 | [Sistema e dispositivo](#sistema-e-dispositivo) | 224 |  |
| 02 | [Android Bug Report](#android-bug-report) | 160 | só faz sentido com bugreport no image |
| 03 | [Comunicações](#comunicações) | 33 |  |
| 04 | [Mensageria](#mensageria) | 144 |  |
| 05 | [Redes sociais](#redes-sociais) | 133 |  |
| 06 | [Navegadores e web](#navegadores-e-web) | 121 |  |
| 07 | [Localização e viagem](#localização-e-viagem) | 128 |  |
| 08 | [Saúde e fitness](#saúde-e-fitness) | 101 |  |
| 09 | [Mídia, fotos e documentos](#mídia-fotos-e-documentos) | 130 |  |
| 10 | [E-mail e produtividade](#e-mail-e-produtividade) | 96 |  |
| 11 | [Finanças e comércio](#finanças-e-comércio) | 57 |  |
| 12 | [Armazenamento seguro e cofres](#armazenamento-seguro-e-cofres) | 84 |  |
| 15 | [IA e assistentes](#ia-e-assistentes) | 48 |  |
| 16 | [VPN e privacidade](#vpn-e-privacidade) | 19 |  |
| 17 | [Câmeras e IoT](#câmeras-e-iot) | 21 |  |
| 13 | [CACHE — pintura pixel a pixel de assets](#cache--pintura-pixel-a-pixel-de-assets) | 4 | **muito lento** |
| 18 | [Jogos e entretenimento social](#jogos-e-entretenimento-social) | 21 |  |
| 14 | [Torrents e limpadores](#torrents-e-limpadores) | 18 |  |

## Avisos que valem para todas as etapas

- A GUI já desmarca por padrão, em `scripts/modules_to_exclude.py`, os módulos que geram muitas linhas:
  `c2paProvenance`, `imagemngCache`, `mmkvCarved` e `walStrings`.
- `get_browserCachechrome` **não** está nessa lista, mas foi ele que travou a execução anterior: ele lê
  cada arquivo `*_0` de `com.android.chrome/cache/Cache/`. No Poco testado eram 109.356 arquivos
  (1,3 GB). Deixe-o para a última etapa, sozinho, ou desmarque-o.
- Rodar por etapas não mescla saídas: cada execução escreve seu próprio `_lava_artifacts.db` e `_HTML/`.
  Use pastas de saída distintas e junte depois, ou reutilize a mesma pasta sabendo que a tabela é
  reescrita por artefato.


## Sistema e dispositivo

`01_sistema_dispositivo` — 224 artefatos. Contas, configurações, apps instalados, permissões, logs de sistema, bateria, serviços Samsung.

<details>
<summary>Categorias (61) e módulos</summary>


**Accounts** (8)

- `syncAccountsXml` — Account Sync Authorities *(module: syncAccounts)*
- `accounts_ce` — Accounts_ce *(module: accounts_ce)*
- `accounts_de` — Accounts_de *(module: accounts_de)*
- `accounts_ce_authtokens` — Authentication tokens *(module: accounts_ce)*
- `gmsAccountHistory` — Google Account History *(module: googleAccountHistory)*
- `knuddels_account` — Knuddels - Account & App Usage *(module: knuddels)*
- `randochat_account` — RandoChat Accounts *(module: RandoChat)*
- `romeo_dating_accounts` — Romeo Dating App Accounts *(module: RomeoDatingApp)*

**Android Auto** (2)

- `extract_android_auto` — Android Auto - Allowed Cars *(module: androidauto)*
- `extract_android_auto_rejected` — Android Auto - Rejected Cars *(module: androidauto)*

**Android Battery Statistics** (2)

- `battery_stats_daily` — Android Battery Stats Daily *(module: batterystats)*
- `battery_stats_daily_package_changes` — Android Battery Stats Daily Package Changes *(module: batterystats)*

**Android Intrusion Logging** (7)

- `ail_connect_events` — Android Intrusion Logging - Connection Events *(module: intrusion_logging)*
- `ail_dns_events` — Android Intrusion Logging - DNS Events *(module: intrusion_logging)*
- `ail_security_events` — Android Intrusion Logging - Security Events *(module: intrusion_logging)*
- `intrusion_store_connect_events` — Intrusion Detection Store - Connection Events *(module: intrusionDetectionStore)*
- `intrusion_store_dns_events` — Intrusion Detection Store - DNS Events *(module: intrusionDetectionStore)*
- `intrusion_store_security_events` — Intrusion Detection Store - Security Events *(module: intrusionDetectionStore)*
- `intrusion_store_selected_account` — Intrusion Detection Store - Selected Account *(module: intrusionDetectionStore)*

**Android Notification History** (3)

- `get_notificationHistory` — Android Notification History *(module: notificationHistory)*
- `get_notificationHistory_snoozed` — Android Notification History - Snoozed *(module: notificationHistory)*
- `get_notificationHistory_status` — Android Notification History - Status *(module: notificationHistory)*

**Android Settings** (1)

- `get_settingsSearch` — Android Settings Search *(module: settingsSearch)*

**Android System** (5)

- `package_dex_usage_list_cross_package` — Dex Usage (Legacy) - Cross-Package Code Loads *(module: packageDexUsageList)*
- `package_dex_usage_list_secondary` — Dex Usage (Legacy) - Secondary Dex Loads *(module: packageDexUsageList)*
- `package_dex_usage_app_code` — Dex Usage - App Code Loads *(module: packageDexUsage)*
- `package_dex_usage_cross_package` — Dex Usage - Cross-Package Code Loads *(module: packageDexUsage)*
- `package_dex_usage_secondary` — Dex Usage - Secondary Dex Loads *(module: packageDexUsage)*

**Android System Intelligence** (1)

- `SimpleStorage_applaunch` — SimpleStorage - App Launch *(module: SimpleStorage_applaunch)*

**Android System Logs** (5)

- `android_anr_traces` — Android ANR Traces *(module: androidDropbox)*
- `dropbox_process_errors` — Android Dropbox - App Crashes, ANRs and Errors *(module: androidDropbox)*
- `dropbox_boot_records` — Android Dropbox - Boot and Restart Records *(module: androidDropbox)*
- `dropbox_other_entries` — Android Dropbox - Other Entries *(module: androidDropbox)*
- `android_tombstones` — Android Tombstones *(module: androidDropbox)*

**App Interaction** (7)

- `get_scontextLog` — scontextLog *(module: scontextLog)*
- `get_smanagerCrash` — smanagerCrash *(module: smanagerCrash)*
- `get_smanagerLow` — smanagerLow *(module: smanagerLow)*
- `get_smembersAppInv` — smembersAppInv *(module: smembersAppInv)*
- `get_smembersEvents` — smembersEvents *(module: smembersEvents)*
- `get_usageapps` — usageapps *(module: usageapps)*
- `get_usageHistory` — Usagehistory *(module: usageHistory)*

**App Inventory** (3)

- `appFileInventory` — App File Inventory *(module: appInventory)*
- `extractionInfo` — Extraction Info *(module: appInventory)*
- `installedAppInventory` — Installed App Inventory *(module: appInventory)*

**App Roles** (1)

- `get_roles` — roles *(module: roles)*

**AppLock** (2)

- `applock_locked_apps` — AppLock Locked Applications *(module: appLock)*
- `applock_vault_media` — AppLock Vault Media *(module: appLock)*

**Aurora Store** (4)

- `aurora_store_accounts` — Aurora Store - Accounts *(module: auroraStore)*
- `aurora_store_downloads` — Aurora Store - Downloads *(module: auroraStore)*
- `aurora_store_favourites` — Aurora Store - Favourites *(module: auroraStore)*
- `aurora_store_updates` — Aurora Store - Updates and Reviews *(module: auroraStore)*

**Bash History** (1)

- `bashHistory` — Bash History *(module: BashHistory)*

**Clipboard** (4)

- `clipboard` — Clipboard Data *(module: clipBoard)*
- `get_honeyboard_clipboard_deleted` — Samsung Honeyboard - Clipboard (Earlier WAL States) *(module: samsung_honeyboard_clipboard)*
- `get_honeyboard_clipboard_live` — Samsung Honeyboard - Clipboard (Live entries) *(module: samsung_honeyboard_clipboard)*
- `get_honeyboard_screenshot` — Samsung Honeyboard - Clipboard Image Clips *(module: samsung_honeyboard_clipboard)*

**Device Health Services** (3)

- `Turbo_Bluetooth` — Turbo - Bluetooth Device Info *(module: deviceHealthServices_Battery)*
- `Turbo_Battery` — Turbo - Phone Battery *(module: deviceHealthServices_Battery)*
- `get_Turbo_AppUsage` — Turbo_AppUsage *(module: deviceHealthServices_AppUsage)*

**Device Information** (12)

- `adb_hosts` — ADB Hosts *(module: adb_hosts)*
- `alex_device_info` — ALEX Info *(module: alexDeviceInfo)*
- `get_build` — Build *(module: build)*
- `constellationSimVerifications` — Constellation SIM Verifications *(module: googleConstellation)*
- `usagestatsVersion` — OS Version *(module: usagestatsVersion)*
- `get_pSettings` — pSettings *(module: pSettings)*
- `get_build_property_observations` — Recognized Build Property Observations *(module: build)*
- `samsungScpmDevices` — Samsung Cloud Platform Devices *(module: samsungScpm)*
- `get_settingsGlobal` — Settings Global *(module: settingsGlobalSystem)*
- `get_settingsSystem` — Settings System *(module: settingsGlobalSystem)*
- `get_settingsSecure` — settingsSecure *(module: settingsSecure)*
- `get_siminfo` — siminfo *(module: siminfo)*

**Device Settings** (2)

- `gmsScreenlockStateHistory` — Google Play Services - Screen Lock State History *(module: gmsScreenlockStateHistory)*
- `lockSettings` — Lock Settings *(module: lockSettings)*

**Device Users** (1)

- `android_users` — Android Users and Profiles *(module: androidUsers)*

**Digital Wellbeing** (5)

- `get_wellbeing_url` — Digital Wellbeing - Component Events *(module: wellbeing)*
- `get_wellbeing` — Digital Wellbeing - Events *(module: wellbeing)*
- `samsung_wellbeing` — Samsung Digital Wellbeing *(module: swellbeing)*
- `samsung_wellbeing_timezone` — Samsung Digital Wellbeing - Timezone Changes *(module: swellbeing)*
- `get_wellbeingaccount` — wellbeingaccount *(module: wellbeingaccount)*

**Emulated Storage Metadata** (6)

- `get_emulatedSmeta_audio` — Emulated Storage Metadata - Audio *(module: emulatedSmeta)*
- `get_emulatedSmeta` — Emulated Storage Metadata - Downloads *(module: emulatedSmeta)*
- `get_emulatedSmeta_files` — Emulated Storage Metadata - Files *(module: emulatedSmeta)*
- `get_emulatedSmeta_files_legacy` — Emulated Storage Metadata - Files (Legacy) *(module: emulatedSmeta)*
- `get_emulatedSmeta_images` — Emulated Storage Metadata - Images *(module: emulatedSmeta)*
- `get_emulatedSmeta_videos` — Emulated Storage Metadata - Videos *(module: emulatedSmeta)*

**Fing** (1)

- `fing_app_state` — Fing App State and Last Network *(module: fing)*

**Firebase Cloud Messaging** (21)

- `get_fcm_groupme` — FCM - GroupMe Notifications *(module: FCMQueuedMessagesGroupMe)*
- `get_fcm_jungrammer` — FCM - Jungrammer *(module: FCMQueuedMessagesJungrammer)*
- `get_fcm_skype` — FCM - Skype and Teams Messages *(module: FCMQueuedMessagesSkype)*
- `get_fcm_skype_notifications` — FCM - Skype and Teams Notifications *(module: FCMQueuedMessagesSkype)*
- `get_fcm_skype_other_events` — FCM - Skype and Teams Other Event Records *(module: FCMQueuedMessagesSkype)*
- `get_fcm_tumblr_flagged` — FCM - Tumblr Flagged Posts *(module: FCMQueuedMessagesTumblr)*
- `get_fcm_tumblr_logs` — FCM - Tumblr Logs *(module: FCMQueuedMessagesTumblr)*
- `get_fcm_tumblr` — FCM - Tumblr Messages *(module: FCMQueuedMessagesTumblr)*
- `get_fcm_tumblr_notifications` — FCM - Tumblr Notifications *(module: FCMQueuedMessagesTumblr)*
- `get_fcm_twitter` — FCM - Twitter DMs *(module: FCMQueuedMessagesTwitter)*
- `get_fcm_xbox` — FCM - Xbox Messages *(module: FCMQueuedMessagesXbox)*
- `get_fcm_xbox_party` — FCM - Xbox Party Invites *(module: FCMQueuedMessagesXbox)*
- `get_fcm_xbox_presence` — FCM - Xbox Presence *(module: FCMQueuedMessagesXbox)*
- `get_fcm_dump_gqsb` — FCM Decoded - Coordinate Payloads (Google Quick Search Box) *(module: FCMQueuedMessagesDump)*
- `get_fcm_dump_instagram` — FCM Decoded - Instagram *(module: FCMQueuedMessagesDump)*
- `get_fcm_dump_tiktok` — FCM Decoded - TikTok *(module: FCMQueuedMessagesDump)*
- `get_fcm_dump_verizon` — FCM Decoded - Verizon *(module: FCMQueuedMessagesDump)*
- `get_fcm_dump` — FCM Dump *(module: FCMQueuedMessagesDump)*
- `fcm_kik` — FCM-KIK Notifications *(module: FCMQueuedMessageKik)*
- `fcm_kik_blanks` — FCM-KIK Notifications Blanks *(module: FCMQueuedMessageKik)*
- `fcm_outlook` — FCM-Outlook Notifications *(module: FCMQueuedMessageOutlook)*

**Fossify Keyboard** (1)

- `fossify_keyboard_clips` — Fossify Keyboard - Clipboard Items *(module: fossifyKeyboard)*

**Gboard Keyboard** (3)

- `get_gboardCache` — Gboard - Clipboard *(module: gboard)*
- `get_gboardCache_keystrokes` — Gboard - Keystroke Cache *(module: gboard)*
- `get_gboardCache_sessions` — Gboard - Sessions *(module: gboard)*

**Google Play Store** (1)

- `GooglePlaySearches` — Google Play Searches *(module: googlePlaySearches)*

**HONOR** (1)

- `honorMediaLibrary` — HONOR - Media Library (Gallery) *(module: honorMediaLibrary)*

**Installed Apps** (18)

- `appIcons` — App Icon *(module: appicons)*
- `frosting` — App Updates (Frosting.db) *(module: frosting)*
- `playDataUsage` — Google Play Store - App Data Usage *(module: playDataUsage)*
- `playInstallSource` — Google Play Store - Install Source *(module: playInstallSource)*
- `graphics_stats` — Graphics Stats Per App Per Day *(module: graphicsStats)*
- `get_installedappsGass` — installedappsGass *(module: installedappsGass)*
- `get_installedappsLibrary` — InstalledappsLibrary *(module: installedappsLibrary)*
- `get_installedappsVending` — InstalledappsVending *(module: installedappsVending)*
- `package_user_states_orphaned` — Orphaned Package User States *(module: packageUserStates)*
- `install_sessions` — Package Install Sessions *(module: installSessions)*
- `rollbackStore` — Package Rollback Records *(module: rollbackStore)*
- `package_restrictions` — Package State Per User *(module: packageRestrictions)*
- `get_package_info` — package_info *(module: packageInfo)*
- `get_packageGplinks` — packageGplinks *(module: packageGplinks)*
- `samsungLauncherIcons` — Samsung Launcher Icons *(module: samsungLauncher)*
- `samsungLauncherItems` — Samsung Launcher Items *(module: samsungLauncher)*
- `samsungLauncherSearchHistory` — Samsung Launcher Search History *(module: samsungLauncher)*
- `settings_ssaid` — SSAID Per App *(module: settingsSsaid)*

**Magisk** (2)

- `magisk_configuration` — Magisk - Configuration *(module: magisk)*
- `magisk_superuser_log` — Magisk - Superuser Log *(module: magisk)*

**MMKV** (1)

- `mmkv_carved_records` — MMKV - Recovered Records *(module: mmkvCarved)* ⚠️ desmarcado por padrão

**Nova Launcher** (2)

- `nova_drawer_groups` — Nova Launcher Drawer Groups *(module: novaLauncher)*
- `nova_layout` — Nova Launcher Layout *(module: novaLauncher)*

**Package Predictions** (1)

- `get_pkgPredictions` — pkgPredictions *(module: pkgPredictions)*

**Permissions** (14)

- `permission_app_op_modes` — App Op Modes (Permission Store) *(module: permissionAccessState)*
- `appops_modes` — App Ops Permission Modes *(module: appOpsModes)*
- `get_appops` — App Ops Permissions *(module: appops)*
- `get_appops_legacy` — App Ops Permissions - Legacy *(module: appops)*
- `appops_accesses` — App Ops Recent Accesses *(module: appOpsAccesses)*
- `permissionChangeDates` — Permission Change Dates *(module: permissionController)*
- `permissionControllerLog` — Permission Controller Log *(module: permissionController)*
- `permissionControllerSafetyLabels` — Permission Controller Safety Label History *(module: permissionController)*
- `get_permissions_packages` — Permission Entries by Element *(module: permissions)*
- `permission_grants` — Permission Grants (Permission Store) *(module: permissionAccessState)*
- `get_permissions_trees` — Permission Trees *(module: permissions)*
- `get_permissions_list` — Permissions *(module: permissions)*
- `get_runtimePerms` — runtimePerms *(module: runtimePerms)*
- `samsungPrivacyDashboardAccess` — Samsung Privacy Dashboard Permission Access *(module: samsungPrivacyDashboard)*

**Power Events** (4)

- `last_boot_time` — Last Boot Time *(module: last_boot_time)*
- `get_oldpowerOffReset` — oldpowerOffReset *(module: oldpowerOffReset)*
- `powerOffReset` — Power Off Reset *(module: powerOffReset)*
- `shutdown_checkpoints` — Shutdown Checkpoints *(module: shutdown_checkpoints)*

**Privacy Dashboard** (1)

- `get_discreteNative` — DiscreteNative *(module: discreteNative)*

**Realm** (1)

- `realmUndecodedStores` — Realm - Undecoded Stores *(module: realmUndecodedStores)*

**Recent Activity** (1)

- `get_recentactivity` — Recent Activity *(module: recentactivity)*

**RethinkDNS** (3)

- `rethinkdns_events` — RethinkDNS - App Events *(module: rethinkDns)*
- `rethinkdns_dns_queries` — RethinkDNS - DNS Queries *(module: rethinkDns)*
- `rethinkdns_connections` — RethinkDNS - Network Connections *(module: rethinkDns)*

**Samsung Badge Provider** (1)

- `samsungBadgeApps` — Samsung Badge Provider *(module: samsungBadgeProvider)*

**Samsung Bixby Routines** (7)

- `samsungBixbyRoutinesPreferences` — Samsung Bixby Routines - App Preferences *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesActions` — Samsung Bixby Routines - Routine Actions *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesConditions` — Samsung Bixby Routines - Routine Conditions *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesRunHistory` — Samsung Bixby Routines - Routine Run History *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesPlaces` — Samsung Bixby Routines - Saved Places *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesServiceLog` — Samsung Bixby Routines - Service Log *(module: samsungBixbyRoutines)*
- `samsungBixbyRoutinesUserRoutines` — Samsung Bixby Routines - User Routines *(module: samsungBixbyRoutines)*

**Samsung CMH** (4)

- `cmh_ocr_text` — CMH Image OCR Text *(module: cmhTags)*
- `cmh_qr_barcodes` — CMH QR and Barcode Content *(module: cmhTags)*
- `cmh_scene_tags` — CMH Scene Tags *(module: cmhTags)*
- `cmh_user_tags` — CMH User Tags *(module: cmhTags)*

**Samsung Device Health Management Service** (8)

- `sdhmsBatteryAppHistory` — SDHMS Battery App History *(module: samsungBatteryStats)*
- `sdhmsBatteryDeviceHistory` — SDHMS Battery Device History *(module: samsungBatteryStats)*
- `sdhmsBatteryEventHistory` — SDHMS Battery Event History *(module: samsungBatteryStats)*
- `sdhmsBatterySystemHistory` — SDHMS Battery System History *(module: samsungBatteryStats)*
- `sdhms_config_reloads` — SDHMS Config Reload History *(module: SamsungDeviceHealthManagement)*
- `sdhms_cpustats` — SDHMS CPU Stats *(module: SamsungDeviceHealthManagement)*
- `sdhms_netstat` — SDHMS Netstat *(module: SamsungDeviceHealthManagement)*
- `sdhms_temperature` — SDHMS Temperature Logs *(module: SamsungDeviceHealthManagement)*

**Samsung History Log** (1)

- `history_log` — Samsung Knox History Log *(module: shistorylog)*

**Samsung IMS Service** (5)

- `samsungImsPdn` — Samsung IMS PDN Network Events *(module: samsungImsService)*
- `samsungImsRegistration` — Samsung IMS Registration Events *(module: samsungImsService)*
- `samsungImsServiceStarts` — Samsung IMS Service Starts *(module: samsungImsService)*
- `samsungImsSimCarrier` — Samsung IMS SIM and Carrier State *(module: samsungImsService)*
- `samsungImsSubscriber` — Samsung IMS Subscriber Identity *(module: samsungImsService)*

**Samsung Media Provider** (2)

- `samsungMediaFiles` — Samsung Media Provider - Files *(module: samsungMediaProvider)*
- `samsungMediaLocations` — Samsung Media Provider - Locations *(module: samsungMediaProvider)*

**Samsung SmartThings** (1)

- `get_samsungSmartThings` — samsungSmartThings *(module: samsungSmartThings)*

**Samsung Story Service** (2)

- `samsungStoryServiceInfo` — Samsung Story Service - Media Info *(module: samsungStoryService)*
- `samsungStoryServiceMoments` — Samsung Story Service - Moments *(module: samsungStoryService)*

**Samsung Weather Clock** (3)

- `get_samsungWeatherClockDaily` — Samsung Weather Clock - Daily *(module: samsungWeatherClock)*
- `get_samsungWeatherClockHourly` — Samsung Weather Clock - Hourly *(module: samsungWeatherClock)*
- `get_samsungWeatherClockInfo` — Samsung Weather Clock - Info *(module: samsungWeatherClock)*

**Samsung_CMH** (1)

- `get_cmh` — cmh *(module: cmh)*

**Settings Services** (1)

- `get_battery_usage_v4` — battery_usage_v4 *(module: battery_usage_v4)*

**Settings Services - Battery Usage v9 - App Battery Usage Events** (1)

- `get_app_usage_events` — Settings Services - App Battery Usages v9 - App Battery Usage Events *(module: battery_usage_v9)*

**Settings Services - Battery Usage v9 - Battery States** (1)

- `get_battery_usage_v9` — Settings Services - Battery Usages v9 - Battery States *(module: battery_usage_v9)*

**Shortcut Service** (3)

- `get_shortcut_service_discord` — Shortcut Service - Discord *(module: shortcut_service)*
- `get_shortcut_service_files` — Shortcut Service - Files *(module: shortcut_service)*
- `get_shortcut_service` — Shortcut Service - Shortcuts *(module: shortcut_service)*

**Smart Sidebar** (2)

- `get_smartSidebarFileDock` — Smart Sidebar File Dock *(module: smartSidebarFileDock)*
- `get_smartSidebarFileDockDb` — Smart Sidebar File Dock Db *(module: smartSidebarFileDock)*

**SQLite Journaling** (1)

- `get_walStrings` — walStrings *(module: walStrings)* ⚠️ desmarcado por padrão

**SwiftKey Keyboard** (4)

- `swiftkey_lm_models` — SwiftKey Language Model - Models *(module: swiftkeyLanguageModel)*
- `swiftkey_lm_sequences` — SwiftKey Language Model - Term Sequences *(module: swiftkeyLanguageModel)*
- `swiftkey_lm_terms` — SwiftKey Language Model - Terms *(module: swiftkeyLanguageModel)*
- `swiftkey_lm_app_terms` — SwiftKey Language Model - Terms by App *(module: swiftkeyLanguageModel)*

**Termux** (3)

- `termux_configuration` — Termux - Configuration *(module: termux)*
- `termux_installed_packages` — Termux - Installed Packages *(module: termux)*
- `termux_apt_history` — Termux - Package Install History *(module: termux)*

**Usage Stats** (2)

- `app_idle_stats` — App Standby Buckets *(module: appIdleStats)*
- `get_usagestats` — Usage Stats *(module: usagestats)*

**User Dictionary** (1)

- `get_userDict` — userDict *(module: userDict)*

**Wipe & Setup** (9)

- `get_appopSetupWiz` — appopSetupWiz *(module: appopSetupWiz)*
- `get_errp` — Errp *(module: errp)*
- `factory_reset` — Factory Reset *(module: factory_reset)*
- `get_persistentProp` — Persistent Properties - Matched Text Observations *(module: persistentProp)*
- `android_setup_flags` — Setup Flags *(module: androidSetupFlags)*
- `get_setupWizardinfo` — setupWizardinfo *(module: setupWizardinfo)*
- `get_sRecoveryhist` — sRecoveryhist *(module: sRecoveryhist)*
- `get_suggestions` — suggestions *(module: suggestions)*
- `get_sWipehist` — sWipehist *(module: sWipehist)*

</details>

## Android Bug Report

`02_bugreport_android` — 160 artefatos. Um artefato por seção do bugreport do Android. Não depende do dump de apps.

<details>
<summary>Categorias (22) e módulos</summary>


**Android Bug Report - Accounts, Sync and Backup** (16)

- `bugreport_account_authenticators` — Bug Report - Account Authenticators *(module: bugreportAccountsPower)*
- `bugreport_account_history` — Bug Report - Account History *(module: bugreportAccountsPower)*
- `bugreport_account_visibility` — Bug Report - Account Visibility *(module: bugreportAccountsPower)*
- `bugreport_accounts` — Bug Report - Accounts *(module: bugreportAccountsPower)*
- `bugreport_backup_package_state` — Bug Report - Backup Package State *(module: bugreportAccountsPower)*
- `bugreport_backup_participants` — Bug Report - Backup Participants *(module: bugreportAccountsPower)*
- `bugreport_backup_queues` — Bug Report - Backup Queues *(module: bugreportAccountsPower)*
- `bugreport_backup_state` — Bug Report - Backup State *(module: bugreportAccountsPower)*
- `bugreport_backup_transports` — Bug Report - Backup Transports *(module: bugreportAccountsPower)*
- `bugreport_sync_adapter_last_syncs` — Bug Report - Sync Adapter Last Syncs *(module: bugreportAccountsPower)*
- `bugreport_sync_adapter_status` — Bug Report - Sync Adapter Status *(module: bugreportAccountsPower)*
- `bugreport_sync_jobs` — Bug Report - Sync Jobs *(module: bugreportAccountsPower)*
- `bugreport_sync_recent_history` — Bug Report - Sync Recent History *(module: bugreportAccountsPower)*
- `bugreport_sync_state` — Bug Report - Sync State *(module: bugreportAccountsPower)*
- `bugreport_user_manager_facts` — Bug Report - User Manager Facts *(module: bugreportAccountsPower)*
- `bugreport_users` — Bug Report - Users *(module: bugreportAccountsPower)*

**Android Bug Report - Alarms and Jobs** (3)

- `bugreport_alarm_history` — Bug Report - Alarm History *(module: bugreportUsageJobs)*
- `bugreport_pending_alarms` — Bug Report - Pending Alarms *(module: bugreportUsageJobs)*
- `bugreport_scheduled_jobs` — Bug Report - Scheduled Jobs *(module: bugreportUsageJobs)*

**Android Bug Report - App Usage** (4)

- `bugreport_standby_buckets` — Bug Report - Standby Buckets *(module: bugreportUsageJobs)*
- `bugreport_usage_events` — Bug Report - Usage Events *(module: bugreportActivity)*
- `bugreport_usage_interval_events` — Bug Report - Usage Interval Event Counts *(module: bugreportUsageJobs)*
- `bugreport_usage_intervals` — Bug Report - Usage Intervals *(module: bugreportUsageJobs)*

**Android Bug Report - Battery and Power** (12)

- `bugreport_battery_daily_summary` — Bug Report - Battery Daily Summary *(module: bugreportAccountsPower)*
- `bugreport_battery_history` — Bug Report - Battery History *(module: bugreportAccountsPower)*
- `bugreport_battery_package_changes` — Bug Report - Battery Package Changes *(module: bugreportAccountsPower)*
- `bugreport_battery_power_use` — Bug Report - Battery Power Use *(module: bugreportAccountsPower)*
- `bugreport_battery_service_state` — Bug Report - Battery Service State *(module: bugreportAccountsPower)*
- `bugreport_battery_wake_locks` — Bug Report - Battery Wake Locks *(module: bugreportAccountsPower)*
- `bugreport_device_idle_history` — Bug Report - Device Idle History *(module: bugreportAccountsPower)*
- `bugreport_device_idle_state` — Bug Report - Device Idle State *(module: bugreportAccountsPower)*
- `bugreport_power_events` — Bug Report - Power Events *(module: bugreportAccountsPower)*
- `bugreport_power_state` — Bug Report - Power Manager State *(module: bugreportAccountsPower)*
- `bugreport_power_wake_locks` — Bug Report - Power Wake Locks *(module: bugreportAccountsPower)*
- `bugreport_thermal_state` — Bug Report - Thermal Service State *(module: bugreportAccountsPower)*

**Android Bug Report - Bluetooth, NFC and USB** (10)

- `bugreport_bluetooth_status` — Bug Report - Bluetooth Adapter Status *(module: bugreportRadios)*
- `bugreport_bluetooth_devices` — Bug Report - Bluetooth Devices *(module: bugreportRadios)*
- `bugreport_bluetooth_events` — Bug Report - Bluetooth Events *(module: bugreportRadios)*
- `bugreport_bluetooth_link_keys` — Bug Report - Bluetooth Link Key Types *(module: bugreportRadios)*
- `bugreport_nfc_services` — Bug Report - NFC Card Emulation Services *(module: bugreportRadios)*
- `bugreport_nfc_driver_log` — Bug Report - NFC Driver Log *(module: bugreportRadios)*
- `bugreport_nfc_events` — Bug Report - NFC Events *(module: bugreportRadios)*
- `bugreport_nfc_state` — Bug Report - NFC State *(module: bugreportRadios)*
- `bugreport_usb_log` — Bug Report - USB Log *(module: bugreportRadios)*
- `bugreport_usb_state` — Bug Report - USB Manager State *(module: bugreportRadios)*

**Android Bug Report - Boot, Crash and Dropbox** (6)

- `bugreport_anr_threads` — Bug Report - ANR Trace Threads *(module: bugreportLogsCrash)*
- `bugreport_boot_reasons` — Bug Report - Boot Reasons *(module: bugreportActivity)*
- `bugreport_dropbox_entries` — Bug Report - Dropbox Entries *(module: bugreportLogsCrash)*
- `bugreport_recovery_history` — Bug Report - Recovery History *(module: bugreportRecovery)*
- `bugreport_reset_reasons` — Bug Report - Reset Reasons *(module: bugreportLogsCrash)*
- `bugreport_tombstones` — Bug Report - Tombstones *(module: bugreportLogsCrash)*

**Android Bug Report - Camera and Media** (7)

- `bugreport_audio_clients` — Bug Report - Audio Clients *(module: bugreportSensorsMedia)*
- `bugreport_audio_events` — Bug Report - Audio Events *(module: bugreportSensorsMedia)*
- `bugreport_audio_playback_order` — Bug Report - Audio Playback Order *(module: bugreportSensorsMedia)*
- `bugreport_camera_devices` — Bug Report - Camera Devices *(module: bugreportSensorsMedia)*
- `bugreport_camera_events` — Bug Report - Camera Service Events *(module: bugreportSensorsMedia)*
- `bugreport_media_metrics` — Bug Report - Media Metrics *(module: bugreportSensorsMedia)*
- `bugreport_media_sessions` — Bug Report - Media Sessions *(module: bugreportSensorsMedia)*

**Android Bug Report - Device and Build** (5)

- `bugreport_build_release_flags` — Bug Report - Build Release Flags *(module: bugreportSecurityStorage)*
- `bugreport_device_facts` — Bug Report - Device Facts *(module: bugreportDevice)*
- `bugreport_device_identifiers` — Bug Report - Device Identifiers *(module: bugreportDevice)*
- `bugreport_sdk_extensions` — Bug Report - SDK Extensions *(module: bugreportSecurityStorage)*
- `bugreport_sections` — Bug Report - Sections *(module: bugreportDevice)*

**Android Bug Report - Display and Input** (9)

- `bugreport_accessibility_services` — Bug Report - Accessibility Services *(module: bugreportSensorsMedia)*
- `bugreport_brightness_events` — Bug Report - Brightness Events *(module: bugreportSensorsMedia)*
- `bugreport_display_states` — Bug Report - Display States *(module: bugreportSensorsMedia)*
- `bugreport_input_methods` — Bug Report - Input Methods *(module: bugreportSensorsMedia)*
- `bugreport_input_start_history` — Bug Report - Input Start History *(module: bugreportSensorsMedia)*
- `bugreport_soft_input_history` — Bug Report - Soft Input History *(module: bugreportSensorsMedia)*
- `bugreport_surfaceflinger_layers` — Bug Report - SurfaceFlinger Layers *(module: bugreportSensorsMedia)*
- `bugreport_window_focus` — Bug Report - Window Focus *(module: bugreportSensorsMedia)*
- `bugreport_windows` — Bug Report - Windows *(module: bugreportSensorsMedia)*

**Android Bug Report - Installed Apps** (2)

- `bugreport_packages` — Bug Report - Installed Packages *(module: bugreportDevice)*
- `bugreport_package_times` — Bug Report - Package Times *(module: bugreportDevice)*

**Android Bug Report - Location and Sensors** (10)

- `bugreport_location_events` — Bug Report - Location Events *(module: bugreportSensorsMedia)*
- `bugreport_location_last_known` — Bug Report - Location Last Known *(module: bugreportSensorsMedia)*
- `bugreport_location_providers` — Bug Report - Location Providers *(module: bugreportSensorsMedia)*
- `bugreport_location_requests` — Bug Report - Location Requests *(module: bugreportSensorsMedia)*
- `bugreport_location_usage` — Bug Report - Location Usage *(module: bugreportSensorsMedia)*
- `bugreport_sensor_connections` — Bug Report - Sensor Connections *(module: bugreportSensorsMedia)*
- `bugreport_sensor_events` — Bug Report - Sensor Events *(module: bugreportSensorsMedia)*
- `bugreport_sensor_registrations` — Bug Report - Sensor Registrations *(module: bugreportSensorsMedia)*
- `bugreport_sensors` — Bug Report - Sensors *(module: bugreportSensorsMedia)*
- `bugreport_time_zone_detection` — Bug Report - Time Zone Detection State *(module: bugreportSensorsMedia)*

**Android Bug Report - Logs** (3)

- `bugreport_event_log` — Bug Report - Event Log *(module: bugreportLogsCrash)*
- `bugreport_kernel_log` — Bug Report - Kernel Log *(module: bugreportLogsCrash)*
- `bugreport_system_log` — Bug Report - System Log *(module: bugreportLogsCrash)*

**Android Bug Report - Network** (14)

- `bugreport_connected_networks` — Bug Report - Connected Networks *(module: bugreportNetwork)*
- `bugreport_dns_servers` — Bug Report - DNS Servers *(module: bugreportNetwork)*
- `bugreport_interface_counters` — Bug Report - Network Interface Counters *(module: bugreportNetwork)*
- `bugreport_network_interfaces` — Bug Report - Network Interfaces *(module: bugreportNetwork)*
- `bugreport_netpolicy_events` — Bug Report - Network Policy Events *(module: bugreportNetwork)*
- `bugreport_netpolicy_settings` — Bug Report - Network Policy Settings *(module: bugreportNetwork)*
- `bugreport_netpolicy_uid_entries` — Bug Report - Network Policy UID Entries *(module: bugreportNetwork)*
- `bugreport_network_usage_buckets` — Bug Report - Network Usage Buckets *(module: bugreportNetwork)*
- `bugreport_open_sockets` — Bug Report - Open Sockets *(module: bugreportNetwork)*
- `bugreport_private_dns_log` — Bug Report - Private DNS Log *(module: bugreportNetwork)*
- `bugreport_socket_details` — Bug Report - Socket Details *(module: bugreportNetwork)*
- `bugreport_tethering_log` — Bug Report - Tethering Log *(module: bugreportNetwork)*
- `bugreport_tethering_state` — Bug Report - Tethering State *(module: bugreportNetwork)*
- `bugreport_unix_sockets` — Bug Report - Unix Domain Sockets *(module: bugreportNetwork)*

**Android Bug Report - Notifications** (3)

- `bugreport_notification_channels` — Bug Report - Notification Channels *(module: bugreportUsageJobs)*
- `bugreport_notification_listeners` — Bug Report - Notification Listeners *(module: bugreportUsageJobs)*
- `bugreport_notification_records` — Bug Report - Notification Records *(module: bugreportUsageJobs)*

**Android Bug Report - Permissions and App Ops** (6)

- `bugreport_appops_accesses` — Bug Report - App Ops Accesses *(module: bugreportPermissions)*
- `bugreport_appops_modes` — Bug Report - App Ops Modes *(module: bugreportPermissions)*
- `bugreport_package_permissions` — Bug Report - Package Permissions *(module: bugreportPermissions)*
- `bugreport_permission_definitions` — Bug Report - Permission Definitions *(module: bugreportPermissions)*
- `bugreport_permission_grants` — Bug Report - Permission Manager Grants *(module: bugreportPermissions)*
- `bugreport_role_holders` — Bug Report - Role Holders *(module: bugreportPermissions)*

**Android Bug Report - Processes and Memory** (6)

- `bugreport_memory_by_process` — Bug Report - Memory By Process *(module: bugreportAccountsPower)*
- `bugreport_memory_process_detail` — Bug Report - Memory Process Detail *(module: bugreportAccountsPower)*
- `bugreport_memory_summary` — Bug Report - Memory Summary *(module: bugreportAccountsPower)*
- `bugreport_process_exits` — Bug Report - Process Exit Info *(module: bugreportActivity)*
- `bugreport_process_stats` — Bug Report - Process Stats *(module: bugreportAccountsPower)*
- `bugreport_process_threads` — Bug Report - Process Threads *(module: bugreportAccountsPower)*

**Android Bug Report - Security and Device Policy** (13)

- `bugreport_adb_state` — Bug Report - ADB Manager State *(module: bugreportSecurityStorage)*
- `bugreport_biometric_events` — Bug Report - Biometric Authentication Events *(module: bugreportSecurityStorage)*
- `bugreport_biometric_sensors` — Bug Report - Biometric Sensors *(module: bugreportSecurityStorage)*
- `bugreport_biometric_statistics` — Bug Report - Biometric Statistics *(module: bugreportSecurityStorage)*
- `bugreport_device_policies` — Bug Report - Device Policies *(module: bugreportSecurityStorage)*
- `bugreport_device_policy_admins` — Bug Report - Device Policy Admins *(module: bugreportSecurityStorage)*
- `bugreport_device_policy_state` — Bug Report - Device Policy State *(module: bugreportSecurityStorage)*
- `bugreport_lock_settings_files` — Bug Report - Lock Settings Files *(module: bugreportSecurityStorage)*
- `bugreport_lock_settings_log` — Bug Report - Lock Settings Log *(module: bugreportSecurityStorage)*
- `bugreport_lock_settings_state` — Bug Report - Lock Settings State *(module: bugreportSecurityStorage)*
- `bugreport_lock_settings_users` — Bug Report - Lock Settings Users *(module: bugreportSecurityStorage)*
- `bugreport_trust_agents` — Bug Report - Trust Agents *(module: bugreportSecurityStorage)*
- `bugreport_trust_events` — Bug Report - Trust Events *(module: bugreportSecurityStorage)*

**Android Bug Report - Settings and Config** (4)

- `bugreport_device_config` — Bug Report - Device Config Flags *(module: bugreportSecurityStorage)*
- `bugreport_platform_compat` — Bug Report - Platform Compat Changes *(module: bugreportSecurityStorage)*
- `bugreport_settings` — Bug Report - Settings *(module: bugreportActivity)*
- `bugreport_settings_changes` — Bug Report - Settings Changes *(module: bugreportActivity)*

**Android Bug Report - Storage and Databases** (11)

- `bugreport_database_files` — Bug Report - Database Files *(module: bugreportSecurityStorage)*
- `bugreport_database_operations` — Bug Report - Database Operations *(module: bugreportSecurityStorage)*
- `bugreport_disk_statistics` — Bug Report - Disk Statistics *(module: bugreportSecurityStorage)*
- `bugreport_file_system_inodes` — Bug Report - File System Inodes *(module: bugreportSecurityStorage)*
- `bugreport_file_systems` — Bug Report - File Systems *(module: bugreportSecurityStorage)*
- `bugreport_mount_points` — Bug Report - Mount Points *(module: bugreportSecurityStorage)*
- `bugreport_open_databases` — Bug Report - Open Databases *(module: bugreportSecurityStorage)*
- `bugreport_package_sizes` — Bug Report - Package Sizes *(module: bugreportSecurityStorage)*
- `bugreport_storage_io` — Bug Report - Storage IO Counters *(module: bugreportSecurityStorage)*
- `bugreport_storage_volumes` — Bug Report - Storage Volumes *(module: bugreportSecurityStorage)*
- `bugreport_vold_log` — Bug Report - Vold Log *(module: bugreportSecurityStorage)*

**Android Bug Report - Telephony** (7)

- `bugreport_carrier_config` — Bug Report - Carrier Config Values *(module: bugreportRadios)*
- `bugreport_radio_state_log` — Bug Report - Radio Log State Lines *(module: bugreportRadios)*
- `bugreport_sim_subscriptions` — Bug Report - SIM Subscriptions *(module: bugreportRadios)*
- `bugreport_telecom_accounts` — Bug Report - Telecom Phone Accounts *(module: bugreportRadios)*
- `bugreport_telephony_logs` — Bug Report - Telephony Service Logs *(module: bugreportRadios)*
- `bugreport_telephony_state` — Bug Report - Telephony State *(module: bugreportRadios)*
- `bugreport_telephony_state_records` — Bug Report - Telephony State Machine Records *(module: bugreportRadios)*

**Android Bug Report - Vendor** (3)

- `bugreport_vendor_custom_state` — Bug Report - knoxcustom State *(module: bugreportSecurityStorage)*
- `bugreport_vendor_guard_log` — Bug Report - knoxguard_service Log *(module: bugreportSecurityStorage)*
- `bugreport_vendor_services` — Bug Report - Vendor Service Lines *(module: bugreportLogsCrash)*

**Android Bug Report - Wi-Fi** (6)

- `bugreport_wifi_connection_events` — Bug Report - Wi-Fi Connection Events *(module: bugreportNetwork)*
- `bugreport_wifi_current_state` — Bug Report - Wi-Fi Current State *(module: bugreportNetwork)*
- `bugreport_wifi_saved_networks` — Bug Report - Wi-Fi Saved Networks *(module: bugreportNetwork)*
- `bugreport_wifi_scan_results` — Bug Report - Wi-Fi Scan Results *(module: bugreportNetwork)*
- `bugreport_wifi_service_log` — Bug Report - Wi-Fi Service Log *(module: bugreportNetwork)*
- `bugreport_wifi_state_records` — Bug Report - Wi-Fi State Machine Records *(module: bugreportNetwork)*

</details>

## Comunicações

`03_comunicacoes` — 33 artefatos. SMS, MMS, RCS, chamadas, contatos e discador.

<details>
<summary>Categorias (14) e módulos</summary>


**Call Logs** (3)

- `sconeCallDataLogs` — Call Data Logs (Scone) *(module: sconeCallDataLogs)*
- `get_calllogs` — Call Logs *(module: calllogs)*
- `get_calllog` — Call logs  *(module: calllog)*

**Contacts** (1)

- `contacts` — Contacts *(module: contacts)*

**Google Call Screen** (1)

- `get_googleCallScreen` — Google Call Screen *(module: googleCallScreen)*

**Google Dialer** (4)

- `googleDialerAnnotatedCallLog` — Google Dialer Annotated Call Log *(module: googleDialer)*
- `googleDialerCachedNumberContacts` — Google Dialer Cached Number Contacts *(module: googleDialer)*
- `googleDialerPhoneLookupHistory` — Google Dialer Phone Lookup History *(module: googleDialer)*
- `googleDialerSmartdial` — Google Dialer Smartdial *(module: googleDialer)*

**Google Duo** (3)

- `get_googleDuo` — Google Duo - Call History *(module: googleDuo)*
- `get_googleDuo_contacts` — Google Duo - Contacts *(module: googleDuo)*
- `get_googleDuo_notes` — Google Duo - Notes *(module: googleDuo)*

**Google Messages** (1)

- `get_googleMessages` — GoogleMessages *(module: googleMessages)*

**Google Voice** (4)

- `googlevoice_calls` — Google Voice - Calls *(module: googleVoice)*
- `googlevoice_messages` — Google Voice - Messages *(module: googleVoice)*
- `googlevoice_accounts` — Google Voice - User Accounts *(module: googleVoice)*
- `googlevoice_voicemails` — Google Voice - Voicemails *(module: googleVoice)*

**Phone** (2)

- `get_callTranscription` — Android Call Transcriptions *(module: callTranscription)*
- `get_blocked_numbers` — Blocked Numbers *(module: blockedNumbers)*

**RCS Chats** (1)

- `get_lgRCS` — LG RCS Chats *(module: lgRCS)*

**SMS & MMS** (3)

- `get_sms_mms_attachments` — MMS Attachments *(module: smsmms)*
- `get_sms_mms_mms` — MMS Messages *(module: smsmms)*
- `get_sms_mms` — SMS Messages *(module: smsmms)*

**SMS & MMS from backup.ab** (2)

- `get_mms_from_backup` — SMS and MMS Backup - MMS *(module: smsmmsBackup)*
- `get_sms_from_backup` — SMS and MMS Backup - SMS *(module: smsmmsBackup)*

**SMS Backup and Restore** (2)

- `smsbackuprestore_backup_sets` — SMS Backup and Restore Backup Sets *(module: smsBackupRestore)*
- `smsbackuprestore_messages` — SMS Backup and Restore Messages *(module: smsBackupRestore)*

**Text Now** (3)

- `get_textnow_call_logs` — Text Now - Call Logs *(module: textnow)*
- `get_textnow_contacts` — Text Now - Contacts *(module: textnow)*
- `get_textnow_messages` — Text Now - Messages *(module: textnow)*

**Truecaller** (3)

- `truecaller_call_cache` — Truecaller - Call Cache *(module: truecaller)*
- `truecaller_call_history` — Truecaller - Call History *(module: truecaller)*
- `truecaller_contacts` — Truecaller - Contacts *(module: truecaller)*

</details>

## Mensageria

`04_mensageria` — 144 artefatos. Apps de mensagem: conversas, grupos, anexos.

<details>
<summary>Categorias (30) e módulos</summary>


**Discord** (1)

- `discordServers` — Discord - Servers *(module: discordServers)*

**Discord Chats** (4)

- `discordCacheEntries` — Discord - API Cache Entries *(module: discordApiCache)*
- `discordCacheMessages` — Discord - Cached Messages (API cache) *(module: discordApiCache)*
- `discordCacheProfiles` — Discord - Cached User Profiles (API cache) *(module: discordApiCache)*
- `get_discordChats` — discordChats *(module: discordChats)*

**Element X** (2)

- `elementx_log_identifiers` — Element X - Identifiers in Logs *(module: elementX)*
- `elementx_sessions` — Element X - Sessions and Stores *(module: elementX)*

**Facebook Messenger** (7)

- `get_fb_threads_calls` — Facebook Messenger - Admin Message Metadata (threads_db2) *(module: FacebookMessenger)*
- `get_fb_msys_calls` — Facebook Messenger - Calls (msys_database) *(module: FacebookMessenger)*
- `get_fb_msys_chats` — Facebook Messenger - Chats (msys_database) *(module: FacebookMessenger)*
- `get_fb_threads_chats` — Facebook Messenger - Chats (threads_db2) *(module: FacebookMessenger)*
- `get_fb_msys_contacts` — Facebook Messenger - Contacts (msys_database) *(module: FacebookMessenger)*
- `get_fb_threads_contacts` — Facebook Messenger - Contacts (threads_db2) *(module: FacebookMessenger)*
- `get_fb_user_id` — Facebook Messenger - User ID *(module: FacebookMessenger)*

**Google Chat** (4)

- `get_googleChat_drafts` — Google Chat - Drafts *(module: googleChat)*
- `get_googleChat_groups` — Google Chat - Groups *(module: googleChat)*
- `get_googleChat` — Google Chat - Messages *(module: googleChat)*
- `get_googleChat_users` — Google Chat - Users *(module: googleChat)*

**GroupMe** (3)

- `get_groupMe_chat` — GroupMe - Chat Information *(module: groupMe)*
- `get_groupMe` — GroupMe - Group Information *(module: groupMe)*
- `get_HideX` — HideX *(module: HideX)*

**Houseparty** (5)

- `housepartyAccount` — Houseparty - Account *(module: houseparty)*
- `housepartyContacts` — Houseparty - Contacts *(module: houseparty)*
- `housepartyMessages` — Houseparty - Direct Messages *(module: houseparty)*
- `housepartyInteractions` — Houseparty - Interactions *(module: houseparty)*
- `housepartyRooms` — Houseparty - Video Rooms *(module: houseparty)*

**IMO** (2)

- `get_imo_account` — IMO - Account ID *(module: imo)*
- `get_imo_messages` — IMO - Messages *(module: imo)*

**Jitsi Meet** (2)

- `jitsi_meet_recent_meetings` — Jitsi Meet - Recent Meetings *(module: jitsiMeet)*
- `jitsi_meet_settings` — Jitsi Meet - Settings *(module: jitsiMeet)*

**JusTalk** (8)

- `justalk_account` — JusTalk - Account *(module: justalk)*
- `justalk_app_state` — JusTalk - App State *(module: justalk)*
- `justalk_calls` — JusTalk - Call Logs *(module: justalk)*
- `justalk_contacts` — JusTalk - Contacts *(module: justalk)*
- `justalk_media` — JusTalk - Media *(module: justalk)*
- `justalk_members` — JusTalk - Members *(module: justalk)*
- `justalk_messages` — JusTalk - Messages *(module: justalk)*
- `justalk_moments` — JusTalk - Moments *(module: justalk)*

**JusTalk Kids** (8)

- `justalk_kids_account` — JusTalk Kids - Account *(module: justalk)*
- `justalk_kids_app_state` — JusTalk Kids - App State *(module: justalk)*
- `justalk_kids_calls` — JusTalk Kids - Call Logs *(module: justalk)*
- `justalk_kids_contacts` — JusTalk Kids - Contacts *(module: justalk)*
- `justalk_kids_media` — JusTalk Kids - Media *(module: justalk)*
- `justalk_kids_members` — JusTalk Kids - Members *(module: justalk)*
- `justalk_kids_messages` — JusTalk Kids - Messages *(module: justalk)*
- `justalk_kids_moments` — JusTalk Kids - Moments *(module: justalk)*

**Kik** (6)

- `kik_attachments` — Kik Attachments *(module: kikMessenger)*
- `kik_chat_metadata` — Kik Chat Metadata *(module: kikMessenger)*
- `kik_local_account` — Kik Local Account *(module: kikMessenger)*
- `kik_messages` — Kik Messages *(module: kikMessenger)*
- `kik_roster` — Kik Roster and Contact Profiles *(module: kikMessenger)*
- `kik_users` — Kik Users *(module: kikMessenger)*

**Line** (3)

- `get_line_calls` — Line - Call Logs *(module: line)*
- `get_line` — Line - Contacts *(module: line)*
- `get_line_messages` — Line - Messages *(module: line)*

**LinkedIn** (2)

- `linkedin_account` — LinkedIn - Account *(module: LinkedIn)*
- `linkedin_messages` — LinkedIn - Messages *(module: LinkedIn)*

**Session Messenger** (3)

- `session_account` — Session - Account *(module: sessionMessenger)*
- `session_attachments` — Session - Attachment Files *(module: sessionMessenger)*
- `session_preferences` — Session - Preferences *(module: sessionMessenger)*

**Signal** (5)

- `get_signalAttachments` — Signal - Attachments *(module: signalAndroid)*
- `get_signalCalls` — Signal - Calls *(module: signalAndroid)*
- `get_signalContacts` — Signal - Contacts *(module: signalAndroid)*
- `get_signalGroups` — Signal - Groups *(module: signalAndroid)*
- `get_signalMessages` — Signal - Messages *(module: signalAndroid)*

**SimpleX Chat** (5)

- `simplex_contacts` — SimpleX Chat - Contacts *(module: simplexChat)*
- `simplex_files` — SimpleX Chat - Files *(module: simplexChat)*
- `simplex_message_edits` — SimpleX Chat - Message Edits *(module: simplexChat)*
- `simplex_messages` — SimpleX Chat - Messages *(module: simplexChat)*
- `simplex_reactions` — SimpleX Chat - Reactions *(module: simplexChat)*

**Skout** (2)

- `get_skout_messages` — Skout Messages *(module: skout)*
- `get_skout_users` — Skout Users *(module: skout)*

**Skype** (3)

- `get_skype_call_logs` — Skype - Call Logs *(module: skype)*
- `get_skype_contacts` — Skype - Contacts *(module: skype)*
- `get_skype_messages` — Skype - Messages *(module: skype)*

**Slack** (5)

- `slack_account` — Slack - Account *(module: slack)*
- `slack_conversations` — Slack - Conversations *(module: slack)*
- `slack_files` — Slack - Files *(module: slack)*
- `slack_messages` — Slack - Messages *(module: slack)*
- `slack_users` — Slack - Users *(module: slack)*

**Tango** (1)

- `get_tangomessage` — tangomessage *(module: tangomessage)*

**Teams** (5)

- `get_teams_activity` — Teams - Activity Feed *(module: teams)*
- `get_teams_calllog` — Teams - Call Log *(module: teams)*
- `get_teams_fileinfo` — Teams - File Info *(module: teams)*
- `get_teams` — Teams - Messages *(module: teams)*
- `get_teams_users` — Teams - Users *(module: teams)*

**Telegram** (13)

- `get_telegramAccounts` — Telegram - Accounts *(module: telegramAndroid)*
- `get_telegramAutoDownload` — Telegram - Auto-Download Settings *(module: telegramAndroid)*
- `get_telegramChannelMembers` — Telegram - Channel & Group Members *(module: telegramAndroid)*
- `get_telegramChatDetails` — Telegram - Chat Details *(module: telegramAndroid)*
- `get_telegramChatHints` — Telegram - Chat Hint Entries *(module: telegramAndroid)*
- `get_telegramChats` — Telegram - Chats *(module: telegramAndroid)*
- `get_telegramContacts` — Telegram - Contacts *(module: telegramAndroid)*
- `get_telegramMessages` — Telegram - Messages *(module: telegramAndroid)*
- `get_telegramPeerDetails` — Telegram - Peer Details *(module: telegramAndroid)*
- `get_telegramPushMessages` — Telegram - Push Messages *(module: telegramAndroid)*
- `get_telegramSaveToGallery` — Telegram - Save to Gallery Settings *(module: telegramAndroid)*
- `get_telegramUsers` — Telegram - Users *(module: telegramAndroid)*
- `get_telegramVoipLogs` — Telegram - VoIP Call Logs *(module: telegramAndroid)*

**Teleguard** (11)

- `get_teleguard_account` — Teleguard - Account *(module: teleguard)*
- `get_teleguard_app_settings` — Teleguard - App Settings *(module: teleguard)*
- `get_teleguard_calls` — Teleguard - Calls *(module: teleguard)*
- `get_teleguard_channels` — Teleguard - Channels *(module: teleguard)*
- `get_teleguard_chat_events` — Teleguard - Chat Events *(module: teleguard)*
- `get_teleguard_contacts` — Teleguard - Contacts *(module: teleguard)*
- `get_teleguard_drafts` — Teleguard - Drafts *(module: teleguard)*
- `get_teleguard_media_downloads` — Teleguard - Media Downloads *(module: teleguard)*
- `get_teleguard` — Teleguard - Messages *(module: teleguard)*
- `get_teleguard_posts` — Teleguard - Posts *(module: teleguard)*
- `get_teleguard_saved_images` — Teleguard - Saved Images *(module: teleguard)*

**Threema** (3)

- `threema_account` — Threema - Account *(module: Threema)*
- `threema_contacts` — Threema - Contacts *(module: Threema)*
- `threema_messages` — Threema - Messages *(module: Threema)*

**Viber** (4)

- `get_Viber_additional` — Viber - Additional *(module: Viber)*
- `get_Viber` — Viber - Call Logs *(module: Viber)*
- `get_Viber_contacts` — Viber - Contacts *(module: Viber)*
- `get_Viber_messages` — Viber - Messages *(module: Viber)*

**WeChat** (4)

- `wechat_account` — WeChat - Account *(module: weChat)*
- `wechat_contacts` — WeChat - Contacts *(module: weChat)*
- `wechat_conversations` — WeChat - Conversations *(module: weChat)*
- `wechat_messages` — WeChat - Messages *(module: weChat)*

**WhatsApp** (16)

- `get_whatsapp_call_logs` — WhatsApp - Call Logs *(module: WhatsApp)*
- `get_whatsapp_channel_messages` — WhatsApp - Channel Messages *(module: WhatsApp)*
- `get_whatsapp_channels` — WhatsApp - Channels *(module: WhatsApp)*
- `get_whatsapp_contacts` — WhatsApp - Contacts *(module: WhatsApp)*
- `get_whatsapp_group_details` — WhatsApp - Group Details *(module: WhatsApp)*
- `get_whatsapp_group_messages` — WhatsApp - Group Messages *(module: WhatsApp)*
- `get_whatsapp_message_edits` — WhatsApp - Message Edit Records *(module: whatsAppExtended)*
- `get_whatsapp_reactions` — WhatsApp - Message Reactions *(module: whatsAppExtended)*
- `get_whatsapp_message_receipts` — WhatsApp - Message Receipts Per Recipient *(module: whatsAppExtended)*
- `get_whatsapp_messages` — WhatsApp - Messages *(module: WhatsApp)*
- `get_whatsapp_one_to_one_messages` — WhatsApp - One To One Messages *(module: WhatsApp)*
- `get_whatsapp_polls` — WhatsApp - Polls *(module: whatsAppExtended)*
- `get_whatsapp_revoked_messages` — WhatsApp - Revoked Messages *(module: whatsAppExtended)*
- `get_whatsapp_system_events` — WhatsApp - System Events *(module: whatsAppExtended)*
- `get_whatsapp_user_profile` — WhatsApp - User Profile *(module: WhatsApp)*
- `get_WhatsAppLogFiles` — WhatsApp Log Files *(module: WhatsAppLogFiles)*

**Wire Messenger** (5)

- `get_wire_cached_files` — Wire Cached Files *(module: wireMessenger)*
- `get_wire_contacts` — Wire Contacts *(module: wireMessenger)*
- `get_wire_messages` — Wire Messages *(module: wireMessenger)*
- `get_wire_proteus_sessions` — Wire Proteus Sessions *(module: wireMessenger)*
- `get_wire_profile` — Wire User Profile *(module: wireMessenger)*

**Zoom** (2)

- `zoom_account` — Zoom - Account and Encrypted Stores *(module: zoom)*
- `zoom_meeting_folders` — Zoom - Meeting Folders *(module: zoom)*

</details>

## Redes sociais

`05_redes_sociais` — 133 artefatos. Perfis, postagens, curtidas, navegação social.

<details>
<summary>Categorias (25) e módulos</summary>


**Badoo** (3)

- `get_badoo_messages` — Badoo - Messages *(module: BadooChat)*
- `get_badoo_chat` — Badoo - Users *(module: BadooChat)*
- `get_badoo_conn` — BadooConnections *(module: BadooConnections)*

**BeReal** (3)

- `bereal_friends` — BeReal - Selected Cached Response Entries *(module: berealAndroid)*
- `bereal_cached_api` — BeReal Cached API Responses *(module: berealAndroid)*
- `bereal_cached_media` — BeReal Cached Media *(module: berealAndroid)*

**BeReal - Social Media** (6)

- `bereal_accepted_friends` — BeReal Android - Accepted Friends *(module: bereal)*
- `bereal_device_user` — BeReal Android - Cached Profile Candidates *(module: bereal)*
- `bereal_comments` — BeReal Android - Comments *(module: bereal)*
- `bereal_profile_pictures` — BeReal Android - Correlated Profile Pictures *(module: bereal)*
- `bereal_posts` — BeReal Android - Posts *(module: bereal)*
- `bereal_realmojis` — BeReal Android - RealMojis *(module: bereal)*

**Bluesky** (4)

- `get_blueskymessages_actors` — Bluesky - Actors *(module: blueskymessages)*
- `get_blueskymessages` — Bluesky - Messages *(module: blueskymessages)*
- `get_blueskyposts` — Bluesky - Posts *(module: blueskyposts)*
- `get_blueskysearches` — Bluesky - Searches *(module: blueskysearches)*

**Bumble** (3)

- `get_bumble_messages` — Bumble - Chat Messages *(module: bumble)*
- `get_bumble_matches` — Bumble - Matches *(module: bumble)*
- `get_bumble` — Bumble - User Settings *(module: bumble)*

**Facebook** (6)

- `facebookAppFeedCache` — Facebook - Cached Feed Stories *(module: facebookApp)*
- `facebookAppContactSync` — Facebook - Contact Sync State *(module: facebookApp)*
- `facebookAppContacts` — Facebook - Contacts *(module: facebookApp)*
- `facebookAppMentionEntities` — Facebook - Mention Typeahead Entities *(module: facebookApp)*
- `facebookAppPreferences` — Facebook - Preferences *(module: facebookApp)*
- `facebookAppTimeInApp` — Facebook - Time In App *(module: facebookApp)*

**GETTR** (5)

- `gettr_app_state` — GETTR - App State *(module: gettr)*
- `gettr_cached_images` — GETTR - Cached Images *(module: gettr)*
- `gettr_channel_members` — GETTR - Conversation Members *(module: gettr)*
- `gettr_messages` — GETTR - Messages *(module: gettr)*
- `gettr_notifications` — GETTR - Notifications *(module: gettr)*

**Hinge** (7)

- `hinge_account_preferences` — Hinge - Account Preferences *(module: hinge)*
- `hinge_account` — Hinge - Account Profile *(module: hinge)*
- `hinge_activity` — Hinge - Activity *(module: hinge)*
- `hinge_cached_images` — Hinge - Cached Images *(module: hinge)*
- `hinge_media` — Hinge - Profile Media *(module: hinge)*
- `hinge_profiles` — Hinge - Profiles *(module: hinge)*
- `hinge_answers` — Hinge - Prompt Answers *(module: hinge)*

**Instagram** (8)

- `instagramAccounts` — Instagram - Accounts *(module: instagram)*
- `instagramCachedVideos` — Instagram - Cached Videos (ExoPlayer) *(module: exoplayerCaches)*
- `instagramContacts` — Instagram - Contacts *(module: instagram)*
- `instagramDirectCalls` — Instagram - Direct Call Events *(module: instagram)*
- `instagramDirectMessages` — Instagram - Direct Messages *(module: instagram)*
- `instagramDirectThreads` — Instagram - Direct Threads *(module: instagram)*
- `instagramPendingMedia` — Instagram - Pending Media *(module: instagramPendingMedia)*
- `instagramTimeInApp` — Instagram - Time In App *(module: instagram)*

**Kwai** (2)

- `kwai_saved_videos` — Kwai Saved Videos *(module: kwai)*
- `kwai_watched_videos` — Kwai Watched Videos *(module: kwai)*

**LIKEE** (3)

- `get_likee_messages` — LIKEE - Messages *(module: likee)*
- `get_likee` — LIKEE - User Location *(module: likee)*
- `get_likee_users` — LIKEE - Users *(module: likee)*

**Mastodon** (6)

- `get_mastodon_accounts` — Mastodon - Account Details *(module: mastodon)*
- `get_mastodon_account_searches` — Mastodon - Account Searches *(module: mastodon)*
- `get_mastodon` — Mastodon - Hashtag Searches *(module: mastodon)*
- `get_mastodon_instance` — Mastodon - Instance Details *(module: mastodon)*
- `get_mastodon_notifications` — Mastodon - Notifications *(module: mastodon)*
- `get_mastodon_timeline` — Mastodon - Timeline *(module: mastodon)*

**MeWe** (9)

- `get_mewe_chat` — MeWe - Chat *(module: mewe)*
- `get_mewe_chat_participants` — MeWe - Chat Participants *(module: mewe)*
- `get_mewe_comments` — MeWe - Comments *(module: mewe)*
- `get_mewe_groups` — MeWe - Groups and Pages *(module: mewe)*
- `get_mewe_polls` — MeWe - Polls *(module: mewe)*
- `get_mewe_post_media` — MeWe - Post Media *(module: mewe)*
- `get_mewe_posts` — MeWe - Posts *(module: mewe)*
- `get_mewe_reactions` — MeWe - Reactions *(module: mewe)*
- `get_mewe_session` — MeWe - SGSession *(module: mewe)*

**Pinterest** (8)

- `pinterest_account` — Pinterest - Account *(module: pinterest)*
- `pinterest_app_state` — Pinterest - App State *(module: pinterest)*
- `pinterest_cached_images` — Pinterest - Cached Images *(module: pinterest)*
- `pinterest_cached_list_pages` — Pinterest - Cached List Pages *(module: pinterest)*
- `pinterest_cached_videos` — Pinterest - Cached Videos *(module: pinterest)*
- `pinterest_idea_pin_drafts` — Pinterest - Idea Pin Drafts *(module: pinterest)*
- `pinterest_search_typeahead_cache` — Pinterest - Search Typeahead Cache *(module: pinterest)*
- `pinterest_stored_accounts` — Pinterest - Stored Accounts *(module: pinterest)*

**Reddit** (10)

- `get_reddit_account` — Reddit - Accounts *(module: reddit)*
- `get_reddit_posts` — Reddit - Cached Posts *(module: reddit)*
- `redditCachedVideos` — Reddit - Cached Videos (ExoPlayer) *(module: exoplayerCaches)*
- `get_reddit_chat_events` — Reddit - Chat Events *(module: reddit)*
- `get_reddit_chat_messages` — Reddit - Chat Messages *(module: reddit)*
- `get_reddit_chat_members` — Reddit - Chat Room Members *(module: reddit)*
- `get_reddit_chat_rooms` — Reddit - Chat Rooms *(module: reddit)*
- `get_reddit_session` — Reddit - Session *(module: reddit)*
- `get_reddit_subreddits` — Reddit - Subreddits *(module: reddit)*
- `get_reddit_users` — Reddit - Users *(module: reddit)*

**RedReader** (3)

- `redreader_accounts` — RedReader - Accounts and Subscriptions *(module: redReader)*
- `redreader_subreddits` — RedReader - Cached Subreddits *(module: redReader)*
- `redreader_cache` — RedReader - Fetch History *(module: redReader)*

**Snapchat** (15)

- `get_snapchat_chat_media` — Snapchat - Chat Media *(module: snapchat)*
- `get_snapchat_arroyo_conversations` — Snapchat - Conversations (arroyo.db) *(module: snapchat)*
- `get_snapchat_core_preferences` — Snapchat - Core Preferences *(module: snapchat)*
- `get_snapchat_core_user_store` — Snapchat - Core User Store *(module: snapchat)*
- `get_snapchat_feeds` — Snapchat - Feeds *(module: snapchat)*
- `get_snapchat_friends` — Snapchat - Friends *(module: snapchat)*
- `get_snapchat_identity` — Snapchat - Identity Persistent Store *(module: snapchat)*
- `get_snapchat_login_signup` — Snapchat - Login Signup Store *(module: snapchat)*
- `snapchatStreamedMedia` — Snapchat - Media Cache Index Entries (ExoPlayer) *(module: exoplayerCaches)*
- `get_snapchat_memories` — Snapchat - Memories *(module: snapchat)*
- `get_snapchat_meo` — Snapchat - MEO My Eyes Only *(module: snapchat)*
- `get_snapchat_messages` — Snapchat - Messages *(module: snapchat)*
- `get_snapchat_arroyo_messages` — Snapchat - Messages (arroyo.db) *(module: snapchat)*
- `get_snapchat_snap_media` — Snapchat - Snap Media *(module: snapchat)*
- `get_snapchat_user_session` — Snapchat - User Session Store *(module: snapchat)*

**Social** (7)

- `untappd_app_events` — Untappd - App Events *(module: untappd)*
- `untappd_cached_checkins` — Untappd - Cached Checkins *(module: untappd)*
- `untappd_recent_locations` — Untappd - Checkin Location Suggestions *(module: untappd)*
- `untappd_dev_events` — Untappd - Device Analytics *(module: untappd)*
- `untappd_discover_locations` — Untappd - Discover Locations *(module: untappd)*
- `untappd_notifications` — Untappd - Push Notifications *(module: untappd)*
- `untappd_profile` — Untappd - User Profile *(module: untappd)*

**Threads** (3)

- `threads_accounts` — Threads - Accounts *(module: threads)*
- `threads_app_usage` — Threads - App Usage *(module: threads)*
- `threads_feed_items` — Threads - Cached Feed Items *(module: threads)*

**TikTok** (6)

- `get_tikTok_account` — TikTok - Account *(module: tikTok)*
- `get_tikTok_app_log_events` — TikTok - App Log Events *(module: tikTok)*
- `get_tikTok_app_open` — TikTok - App Open Records *(module: tikTok)*
- `get_tikTok_contacts` — TikTok - Contacts *(module: tikTok)*
- `get_tikTok_downloads` — TikTok - Downloads *(module: tikTok)*
- `get_tikTok` — TikTok - Messages *(module: tikTok)*

**Tinder** (5)

- `tinderAccount` — Tinder - Account *(module: tinder)*
- `tinderInboxMessages` — Tinder - Inbox Messages *(module: tinder)*
- `tinderMatches` — Tinder - Matches *(module: tinder)*
- `tinderMessages` — Tinder - Messages *(module: tinder)*
- `tinderProfilePhotos` — Tinder - Profile Photos *(module: tinder)*

**Tusky** (2)

- `get_tusky_accounts` — Tusky - Account Details *(module: tusky)*
- `get_tusky` — Tusky - Timeline *(module: tusky)*

**Twitter** (2)

- `get_Twitter` — twitter *(module: Twitter)*
- `twitterCachedVideos` — Twitter - Cached Videos (ExoPlayer) *(module: exoplayerCaches)*

**Weibo** (3)

- `weibo_long_posts` — Weibo - Long Posts *(module: weibo)*
- `weibo_post_images` — Weibo - Post Images *(module: weibo)*
- `weibo_timeline` — Weibo - Timeline Posts *(module: weibo)*

**Xiaohongshu** (4)

- `xiaohongshu_account` — Xiaohongshu (RED) - Account *(module: xiaohongshu)*
- `xiaohongshu_app_launches` — Xiaohongshu (RED) - App Launches *(module: xiaohongshu)*
- `xiaohongshu_play_history` — Xiaohongshu (RED) - Play History *(module: xiaohongshu)*
- `xiaohongshu_recent_chats` — Xiaohongshu (RED) - Recent Chats *(module: xiaohongshu)*

</details>

## Navegadores e web

`06_navegadores_web` — 121 artefatos. Histórico, favoritos, downloads, senhas e artefatos web (mister_skinnylegs).

<details>
<summary>Categorias (17) e módulos</summary>


**Chrome Sync** (4)

- `chrome_sync_device_info` — Chrome Sync - Device Info *(module: chromeSyncSessions)*
- `chrome_sync_send_tab_to_self` — Chrome Sync - Send Tab To Self *(module: chromeSyncSessions)*
- `chrome_sync_devices` — Chrome Sync - Session Devices *(module: chromeSyncSessions)*
- `chrome_sync_sessions` — Chrome Sync - Synced Tabs *(module: chromeSyncSessions)*

**Chromium** (34)

- `get_chromeBookmarks` — Bookmarks *(module: chromeBookmarks)*
- `chromeBrowsingTopics` — Browsing Topics API Usage *(module: chromeBrowsingTopics)*
- `get_chromeAutofill` — Chrome Autofill - Entries *(module: chromeAutofill)*
- `get_chromeAutofillProfiles` — Chrome Autofill - Profiles *(module: chromeAutofill)*
- `get_chromeCacheVideos` — Chrome Cache - Videos *(module: chromeCacheVideos)*
- `get_chromeDIPS` — ChromeDIPS *(module: chromeDIPS)*
- `chromiumCacheEntries` — Chromium Browsers - HTTP Cache Entries *(module: chromiumHttpCache)*
- `chromiumCacheIndexes` — Chromium Browsers - HTTP Cache Indexes *(module: chromiumHttpCache)*
- `get_chromeDownloadMediaStore` — Chromium Downloads - MediaStore Correlation *(module: chromeDownloadMediaStore)*
- `chromiumFileSystemBuckets` — Chromium File System API - Bucket Storage *(module: chromiumFileSystem)*
- `chromiumFileSystemEntries` — Chromium File System API - Files *(module: chromiumFileSystem)*
- `chromiumFileSystemSites` — Chromium File System API - Sites *(module: chromiumFileSystem)*
- `chromiumPermissionActions` — Chromium Permission Prompt Actions *(module: chromiumSitePermissions)*
- `chromiumPermissionPromptCounts` — Chromium Permission Prompt Counts *(module: chromiumSitePermissions)*
- `chromiumShareHistory` — Chromium Share History *(module: chromiumWebsiteUsage)*
- `chromiumSitePermissions` — Chromium Site Permissions *(module: chromiumSitePermissions)*
- `chromiumWebNotifications` — Chromium Web Notifications *(module: chromiumNotifications)*
- `chromiumWebsiteUsageEvents` — Chromium Website Usage Events *(module: chromiumWebsiteUsage)*
- `get_chromeCookies` — Cookies *(module: chromeCookies)*
- `get_chromeDownloads` — Downloads *(module: chrome)*
- `get_chromeKeywordSearchTerms` — Keyword Search Terms *(module: chrome)*
- `get_chromeLoginData` — Login Data *(module: chromeLoginData)*
- `get_chromeMediaHistoryOrigins` — Media History - Origins *(module: chromeMediaHistory)*
- `get_chromeMediaHistoryPlaybacks` — Media History - Playbacks *(module: chromeMediaHistory)*
- `get_chromeMediaHistorySessions` — Media History - Sessions *(module: chromeMediaHistory)*
- `get_chromeNetworkActionPredictor` — Network Action Predictor *(module: chromeNetworkActionPredictor)*
- `get_chromeOfflinePages` — Offline Pages *(module: chromeOfflinePages)*
- `chromeShortcuts` — Omnibox Shortcuts *(module: chromeShortcuts)*
- `get_chromePaymentsCustomerData` — Payments Customer Data *(module: chromePaymentsCustomerData)*
- `get_chromeCreditCards` — Saved Credit Cards *(module: chromeCreditCards)*
- `get_chromeSearchTerms` — Search Terms *(module: chrome)*
- `get_chromeTopSites` — Top Sites *(module: chromeTopSites)*
- `get_chrome` — Web History *(module: chrome)*
- `get_chromeWebVisits` — Web Visits *(module: chrome)*

**Chromium Sessions** (2)

- `chrome_session_tabs` — Chromium Session Tabs - Navigation Entries *(module: chromeSessionTabs)*
- `chrome_session_tab_state` — Chromium Session Tabs - Tab State *(module: chromeSessionTabs)*

**DuckDuckGo** (9)

- `duckduckgo_bookmarks` — DuckDuckGo - Bookmarks *(module: DuckDuckGo)*
- `duckduckgo_cookies` — DuckDuckGo - Cookies *(module: DuckDuckGo)*
- `duckduckgo_downloads` — DuckDuckGo - Downloads *(module: DuckDuckGo)*
- `duckduckgo_duckai` — DuckDuckGo - Duck AI *(module: DuckDuckGo)*
- `duckduckgo_favorites` — DuckDuckGo - Favorited Sites *(module: DuckDuckGo)*
- `duckduckgo_fireproof` — DuckDuckGo - FireProof Sites *(module: DuckDuckGo)*
- `duckduckgo_opentabs` — DuckDuckGo - Open Tabs *(module: DuckDuckGo)*
- `duckduckgo_thumbnails` — DuckDuckGo - Tab Thumbnails *(module: DuckDuckGo)*
- `duckduckgo_history` — DuckDuckGo - Web Browser History *(module: DuckDuckGo)*

**Firefox** (10)

- `get_firefox_bookmarks` — Firefox - Bookmarks *(module: firefox)*
- `get_firefoxCookies` — Firefox - Cookies *(module: firefoxCookies)*
- `get_firefoxDownloads` — Firefox - Downloads *(module: firefoxDownloads)*
- `get_firefoxFormHistory` — Firefox - Form History *(module: firefoxFormHistory)*
- `get_firefoxPermissions` — Firefox - Permissions *(module: firefoxPermissions)*
- `get_firefoxRecentlyClosedTabs` — Firefox - Recently Closed Tabs *(module: firefoxRecentlyClosedTabs)*
- `get_firefox_searches` — Firefox - Search Terms *(module: firefox)*
- `get_firefoxTopSites` — Firefox - Top Sites *(module: firefoxTopSites)*
- `get_firefox_history` — Firefox - Web History *(module: firefox)*
- `get_firefox_visits` — Firefox - Web Visits *(module: firefox)*

**Kiwix** (2)

- `kiwix_reading_history` — Kiwix - Reading History *(module: kiwix)*
- `kiwix_searches` — Kiwix - Searches *(module: kiwix)*

**Mi Browser** (3)

- `mibrowser_downloads` — Mi Browser - Downloads *(module: miBrowser)*
- `mibrowser_history` — Mi Browser - History *(module: miBrowser)*
- `mibrowser_searches` — Mi Browser - Searches and Top Sites *(module: miBrowser)*

**Mozilla Browsers** (1)

- `mozillaProfileTimes` — Mozilla Browser Profile Times *(module: mozillaProfileTimes)*

**MSL Web Artifacts** (28)

- `binance_balances_msl_plugin` — Browser Data - Binance Balances (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `binance_user_details_msl_plugin` — Browser Data - Binance User Details (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `bing_searches_msl_plugin` — Browser Data - Bing searches (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `chatgpt_chat_information_msl_plugin` — Browser Data - ChatGPT Chat Information (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `chatgpt_user_information_msl_plugin` — Browser Data - ChatGPT User Information (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `coinbase_balances_msl_plugin` — Browser Data - Coinbase Balances (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `coinbase_payment_methods_msl_plugin` — Browser Data - Coinbase Payment Methods (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `coinbase_transactions_msl_plugin` — Browser Data - Coinbase Transactions (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `coinbase_user_details_msl_plugin` — Browser Data - Coinbase User Details (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `deepseek_chat_messages_msl_plugin` — Browser Data - DeepSeek Chat Messages (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `deepseek_chat_session_information_msl_plugin` — Browser Data - DeepSeek Chat Session Information (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `deepseek_user_information_msl_plugin` — Browser Data - DeepSeek User Information (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `discord_chat_messages_msl_plugin` — Browser Data - Discord Chat Messages (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `downloads_msl_plugin` — Browser Data - Downloads (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `dropbox_file_system_msl_plugin` — Browser Data - Dropbox File System (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `dropbox_session_storage_user_activity_msl_plugin` — Browser Data - Dropbox Session Storage User Activity (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `dropbox_thumbnails_msl_plugin` — Browser Data - Dropbox Thumbnails (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `duckduckgo_searches_msl_plugin` — Browser Data - Duckduckgo searches (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `google_drive_files_and_folders_msl_plugin` — Browser Data - Google Drive Files and Folders (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `google_drive_thumbnails_msl_plugin` — Browser Data - Google Drive Thumbnails (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `google_drive_usage_msl_plugin` — Browser Data - Google Drive Usage (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `google_searches_msl_plugin` — Browser Data - Google searches (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `history_msl_plugin` — Browser Data - History (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `localstorage_msl_plugin` — Browser Data - Localstorage (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `o365_sharepoint_recent_files_msl_plugin` — Browser Data - O365-Sharepoint recent files (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `o365_sharepoint_user_activity_msl_plugin` — Browser Data - O365-Sharepoint user activity (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `reddit_chat_messages_msl_plugin` — Browser Data - Reddit Chat Messages (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*
- `sessionstorage_msl_plugin` — Browser Data - Sessionstorage (Mister Skinnylegs) *(module: browserArtifactsViaMisterSkinnylegs)*

**NewPipe** (5)

- `newpipe_playback_positions` — NewPipe - Playback Positions *(module: newpipe)*
- `newpipe_playlists` — NewPipe - Playlists *(module: newpipe)*
- `newpipe_search_history` — NewPipe - Search History *(module: newpipe)*
- `newpipe_subscriptions` — NewPipe - Subscriptions *(module: newpipe)*
- `newpipe_watch_history` — NewPipe - Watch History *(module: newpipe)*

**Offline Pages** (1)

- `get_offlinePages` — Offline Pages (MHTML) *(module: offlinePages)*

**Opera** (2)

- `opera_tab_navigation` — Opera Browser - Tab Navigation History *(module: OperaBrowser)*
- `opera_tabs` — Opera Browser - Tabs *(module: OperaBrowser)*

**Ornet Browser** (10)

- `ornetbrowser_bookmarks` — Ornet Browser - Bookmarks *(module: OrnetBrowser)*
- `ornetbrowser_cookies` — Ornet Browser - Cookies *(module: OrnetBrowser)*
- `ornetbrowser_downloads` — Ornet Browser - Downloads *(module: OrnetBrowser)*
- `ornetbrowser_frequents` — Ornet Browser - Frequents *(module: OrnetBrowser)*
- `ornetbrowser_opentabs` — Ornet Browser - Open Tabs *(module: OrnetBrowser)*
- `ornetbrowser_searchhistory` — Ornet Browser - Search History *(module: OrnetBrowser)*
- `ornetbrowser_suggestions` — Ornet Browser - Suggestions *(module: OrnetBrowser)*
- `ornetbrowser_thumbnails` — Ornet Browser - Tab Thumbnails *(module: OrnetBrowser)*
- `ornetbrowser_usageinfo` — Ornet Browser - Usage Info *(module: OrnetBrowser)*
- `ornetbrowser_history` — Ornet Browser - Web Browser History *(module: OrnetBrowser)*

**Samsung Browser** (1)

- `get_sharedProto` — Shared Proto Data *(module: sharedProto)*

**TOR** (1)

- `get_torThumbs` — TOR Thumbnails *(module: torThumbs)*

**Tor Browser** (3)

- `torbrowser_bookmarks` — Tor Browser - Bookmarks *(module: TorBrowser)*
- `torbrowser_usageinfo` — Tor Browser - Usage Info *(module: TorBrowser)*
- `torbrowser_thumbnails` — Tor Browser Tab Thumnails *(module: TorBrowser)*

**VLC** (5)

- `get_vlcMedia` — VLC *(module: vlcMedia)*
- `get_vlcthumbsADB_medialib` — VLC Media Lib (ADB) *(module: vlcthumbsADB)*
- `get_vlcThumbs_data` — VLC Thumbnail Data *(module: vlcThumbs)*
- `get_vlcThumbs` — VLC Thumbnails *(module: vlcThumbs)*
- `get_vlcthumbsADB` — VLC Thumbnails (ADB) *(module: vlcthumbsADB)*

</details>

## Localização e viagem

`07_localizacao_viagem` — 128 artefatos. Coordenadas, mapas, rotas, transporte e rastreamento.

<details>
<summary>Categorias (27) e módulos</summary>


**AccuWeather** (1)

- `accuweather_location` — AccuWeather Location *(module: accuWeather)*

**Airtag Detection** (4)

- `airtagAlerts` — Android Airtag Alerts *(module: airtagAndroid)*
- `airtagLastScan` — Android Airtag Last Scan *(module: airtagAndroid)*
- `airtagPassiveScan` — Android Airtag Passive Scan *(module: airtagAndroid)*
- `airtagScans` — Android Airtag Scans *(module: airtagAndroid)*

**AirTags** (3)

- `get_airGuard_scans` — AirGuard AirTag Scans *(module: airGuard)*
- `get_airGuard` — AirGuard AirTag Tracker *(module: airGuard)*
- `get_atrackerdetect` — atrackerdetect *(module: atrackerdetect)*

**AllTrails** (4)

- `alltrails_photos` — AllTrails - Photos *(module: allTrails)*
- `alltrails_recorded_activities` — AllTrails - Recorded Activities *(module: allTrails)*
- `alltrails_trackpoints` — AllTrails - Trackpoints *(module: allTrails)*
- `alltrails_user` — AllTrails - User *(module: allTrails)*

**App Semantic Locations** (2)

- `get_appSemloc` — App Semantic Locations *(module: appSemloc)*
- `get_urluser` — ULR User Prefs *(module: ulrUserprefs)*

**Booking.com** (12)

- `booking_account_profile` — Booking - Account Profile *(module: booking)*
- `booking_app_state` — Booking - App State *(module: booking)*
- `booking_cached_profile` — Booking - Cached Profile Response *(module: booking)*
- `booking_cached_requests` — Booking - Cached Requests *(module: booking)*
- `booking_deep_links` — Booking - Deep Links *(module: booking)*
- `booking_destination_info` — Booking - Destination Info *(module: booking)*
- `booking_destination_searches` — Booking - Destination Searches *(module: booking)*
- `booking_notifications` — Booking - Notifications *(module: booking)*
- `booking_profile_preferences` — Booking - Profile Preferences *(module: booking)*
- `booking_reservation_rooms` — Booking - Reservation Rooms *(module: booking)*
- `booking_reservations` — Booking - Reservations *(module: booking)*
- `booking_search_query` — Booking - Search Query *(module: booking)*

**Breezy Weather** (2)

- `breezyweather_locations` — Breezy Weather - Locations *(module: breezyWeather)*
- `breezyweather_alerts` — Breezy Weather - Weather Alerts *(module: breezyWeather)*

**Citymapper** (3)

- `get_citymapperAppPreferences` — Citymapper - App Preferences *(module: citymapper)*
- `get_citymapperLocationHistory` — Citymapper - Location History *(module: citymapper)*
- `get_citymapperSavedTrips` — Citymapper - Saved Trips *(module: citymapper)*

**DHL** (2)

- `dhl_account` — DHL - Account and Settings *(module: dhl)*
- `dhl_tracked_shipments` — DHL - Tracked Shipments *(module: dhl)*

**GEO Location** (14)

- `get_browserlocation` — Browser Location *(module: browserlocation)*
- `get_cachelocation` — Cache Location *(module: cachelocation)*
- `get_googleInitiatedNav` — Google Maps - Navigated Cache Entries *(module: googleInitiatedNav)*
- `get_googleMapsGmm` — Google Maps Directions *(module: googleMapsGmm)*
- `get_googleMapsGmm_places` — Google Maps Label Places *(module: googleMapsGmm)*
- `get_googleLastTrip` — Google Maps Last Trip *(module: googleLastTrip)*
- `get_googleMapsSearches` — Google Maps Searches *(module: googleMapsSearches)*
- `get_googlemaplocation` — Googlemaplocation *(module: googlemaplocation)*
- `gmsOdlhEditedSegments` — ODLH Edited Segments *(module: googleOdlh)*
- `gmsOdlhPathPoints` — ODLH Path Points *(module: googleOdlh)*
- `gmsOdlhSemanticSegments` — ODLH Semantic Segments *(module: googleOdlh)*
- `get_Oruxmaps` — Oruxmaps - POI *(module: Oruxmaps)*
- `get_Oruxmaps_tracks` — Oruxmaps - Tracks *(module: Oruxmaps)*
- `samsungWifiGeofence` — Samsung WiFi Geofence *(module: samsungWifiDatabases)*

**Google Maps** (2)

- `googleMapsSyncPeople` — Google Maps Sync - People *(module: googleMapsSync)*
- `googleMapsSyncPlaces` — Google Maps Sync - Places *(module: googleMapsSync)*

**Google Maps Voice Guidance** (2)

- `get_googlemapaudio` — Google Maps Voice Guidance *(module: googlemapaudio)*
- `get_googlemapaudioTemp` — Google Maps Voice Guidance (Temp) *(module: googlemapaudioTemp)*

**HERE WeGo** (4)

- `here_wego_map_positions` — HERE WeGo Map Positions *(module: hereWeGo)*
- `here_wego_recent_searches` — HERE WeGo Recent Searches *(module: hereWeGo)*
- `here_wego_saved_places` — HERE WeGo Saved Places *(module: hereWeGo)*
- `here_wego_settings` — HERE WeGo Settings *(module: hereWeGo)*

**Life360** (26)

- `life360CacheEntries` — Life360 - API Cache Entries *(module: life360ApiCache)*
- `get_Life360_chat_messages` — Life360 - Chat Messages *(module: Life360)*
- `get_Life360_device_battery` — Life360 - Device Battery *(module: Life360)*
- `life360CacheEmergencyContacts` — Life360 - Emergency Contacts (API cache) *(module: life360ApiCache)*
- `get_Life360_locations` — Life360 - Locations *(module: Life360)*
- `life360CacheMemberHistory` — Life360 - Member Location History (API cache) *(module: life360ApiCache)*
- `get_Life360_places` — Life360 - Places *(module: Life360)*
- `life360ActivityTransitions` — Life360 Activity Transitions *(module: life360LocalStores)*
- `Life360_BatteryLevel` — Life360 Battery Level *(module: L360eventstore)*
- `life360CircleDevices` — Life360 Circle Devices *(module: life360LocalStores)*
- `Life360_CircleSettings` — Life360 CircleSettings *(module: L360circlesettings)*
- `life360DeviceLocationStore` — Life360 Device Location Store *(module: life360LocalStores)*
- `Life360_DriveEvents` — Life360 Drive Events (DriveBladeDB) *(module: L360driveblade)*
- `Life360_Drive_Events` — Life360 Drive Events (EventStore) *(module: L360eventstore)*
- `Life360_DriveWaypoints` — Life360 Drive Waypoints *(module: L360driveblade)*
- `Life360_Drives` — Life360 Drives *(module: L360driveblade)*
- `life360Geofences` — Life360 Geofences *(module: life360LocalStores)*
- `Life360_Locations` — Life360 Locations *(module: L360eventstore)*
- `life360MemberDeviceLocations` — Life360 Member Device Locations *(module: life360LocalStores)*
- `Life360_MemberCircles` — Life360 Members and Circles *(module: L360memberscircles)*
- `Life360_NoShowAlerts` — Life360 No Show Alerts *(module: L360noshowalerts)*
- `Life360_PetProfile` — Life360 PetProfile *(module: L360petprofile)*
- `Life360_PlaceAlerts` — Life360 Place Alerts *(module: L360places)*
- `Life360_Places` — Life360 Places *(module: L360places)*
- `Life360_User` — Life360 User *(module: L360user)*
- `Life360_Waypoints` — Life360 Waypoints *(module: L360eventstore)*

**Life360DriverBehavior** (2)

- `get_TripEvents` — Life360 Driver Behavior - Trip Events *(module: life360DriverBehavior)*
- `get_TripWaypoints` — Life360 Driver Behavior - Trip Waypoints *(module: life360DriverBehavior)*

**Meteo** (2)

- `swissmeteo_plz` — Swissmeteo - app_open table rows *(module: swissmeteo)*
- `plz_interaction` — Swissmeteo - Place interaction records *(module: swissmeteo)*

**Moovit** (1)

- `moovit_trip_plan_history` — Moovit Trip Plan History *(module: moovit)*

**Organic Maps** (2)

- `organicmaps_bookmarks` — Organic Maps - Bookmarks *(module: organicMaps)*
- `organicmaps_tracks` — Organic Maps - Line Placemark Summaries *(module: organicMaps)*

**OsmAnd** (2)

- `osmand_app_events` — OsmAnd - App Events *(module: osmand)*
- `osmand_search_history` — OsmAnd - Search History *(module: osmand)*

**Puma** (1)

- `get_puma_activities` — Puma - Activities *(module: PumaActivities)*

**Puma-Trac** (1)

- `get_puma_users` — PumaUsers *(module: PumaUsers)*

**Ryanair** (9)

- `ryanair_boarding_passes` — Ryanair - Boarding Passes *(module: ryanair)*
- `ryanair_bookings` — Ryanair - Bookings *(module: ryanair)*
- `ryanair_day_of_travel` — Ryanair - Day of Travel Content *(module: ryanair)*
- `ryanair_flights` — Ryanair - Flights *(module: ryanair)*
- `ryanair_passengers` — Ryanair - Passengers *(module: ryanair)*
- `ryanair_recent_locations` — Ryanair - Recent Locations *(module: ryanair)*
- `ryanair_recent_searches` — Ryanair - Recent Searches *(module: ryanair)*
- `ryanair_sessions` — Ryanair - Sessions *(module: ryanair)*
- `ryanair_user_profile` — Ryanair - User Profile *(module: ryanair)*

**Trail Sense** (3)

- `trailsense_beacons` — Trail Sense - Beacons *(module: trailSense)*
- `trailsense_paths` — Trail Sense - Paths *(module: trailSense)*
- `trailsense_waypoints` — Trail Sense - Waypoints *(module: trailSense)*

**Travel** (4)

- `cff_search_history` — SBB Mobile - Search History *(module: sbbmobile)*
- `cff_searched_places` — SBB Mobile - Searched places *(module: sbbmobile)*
- `cff_purchased_tickets` — SBB Mobile - Ticket Purchased recently *(module: sbbmobile)*
- `cff_travel_cards` — SBB Mobile - Travel Cards *(module: sbbmobile)*

**Uber** (9)

- `uber_account` — Uber - Account *(module: uber)*
- `uber_settings` — Uber - App Settings *(module: uber)*
- `uber_cached_images` — Uber - Cached Images *(module: uber)*
- `uber_city` — Uber - City *(module: uber)*
- `uber_locations` — Uber - Locations *(module: uber)*
- `uber_payment_profiles` — Uber - Payment Profiles *(module: uber)*
- `uber_sessions` — Uber - Sessions *(module: uber)*
- `uber_shortcuts` — Uber - Suggested Destinations *(module: uber)*
- `uber_telemetry` — Uber - Telemetry Messages *(module: uber)*

**Waze** (9)

- `waze_account` — Waze - Account *(module: waze)*
- `waze_favorite_locations` — Waze - Favorite Locations *(module: waze)*
- `waze_search_history` — Waze - Places *(module: waze)*
- `waze_planned_events` — Waze - Planned Events *(module: waze)*
- `waze_recent_locations` — Waze - Recent Locations *(module: waze)*
- `waze_session_info` — Waze - Session Info *(module: waze)*
- `waze_shared_locations` — Waze - Shared Locations *(module: waze)*
- `waze_tts` — Waze - Text-To-Speech Navigation *(module: waze)*
- `waze_track_gps_quality` — Waze - Track GPS Quality *(module: waze)*

**what3words** (2)

- `what3words_lists` — what3words - Location Lists *(module: what3words)*
- `what3words_saved_places` — what3words - Locations *(module: what3words)*

</details>

## Saúde e fitness

`08_saude_fitness` — 101 artefatos. Dispositivos vestíveis, passos, sono, treinos e métricas corporais.

<details>
<summary>Categorias (19) e módulos</summary>


**Adidas** (1)

- `get_adidas_activities` — Adidas Running - Activities *(module: AdidasActivities)*

**Adidas-Running** (2)

- `get_adidas_goals` — AdidasGoals *(module: AdidasGoals)*
- `get_adidas_user` — AdidasUser *(module: AdidasUser)*

**Fitbit** (24)

- `get_fitbit_wearos_azm` — Fitbit - Active Zones (Wear OS) *(module: fitbit)*
- `get_fitbit_activity` — Fitbit - Activity *(module: fitbit)*
- `get_fitbit_wearos_activity` — Fitbit - Activity History (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_daily` — Fitbit - Daily Activity (Wear OS) *(module: fitbit)*
- `get_fitbit_device` — Fitbit - Device Info *(module: fitbit)*
- `get_fitbit_exercise` — Fitbit - Exercise GPS *(module: fitbit)*
- `get_fitbit_routes` — Fitbit - Exercise Routes *(module: fitbit)*
- `get_fitbit_friends` — Fitbit - Friends *(module: fitbit)*
- `get_fitbit_wearos_gps_route` — Fitbit - GPS Route (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_gps` — Fitbit - GPS Trackpoints (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_hr` — Fitbit - Heart Rate Stats (Wear OS) *(module: fitbit)*
- `get_fitbit_heart` — Fitbit - Heart Rate Summary *(module: fitbit)*
- `get_fitbit_wearos_hourly` — Fitbit - Hourly Steps (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_pace` — Fitbit - Live Pace (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_opaque_hr` — Fitbit - Opaque HR (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_sleep` — Fitbit - Sleep (Wear OS) *(module: fitbit)*
- `get_fitbit_sleep_detail` — Fitbit - Sleep Detail *(module: fitbit)*
- `get_fitbit_wearos_sleep_logs` — Fitbit - Sleep Logs (Wear OS) *(module: fitbit)*
- `get_fitbit_sleep_summary` — Fitbit - Sleep Summary *(module: fitbit)*
- `get_fitbit_steps` — Fitbit - Steps *(module: fitbit)*
- `get_fitbit_user` — Fitbit - User Profile *(module: fitbit)*
- `get_fitbit_wearos_profile` — Fitbit - User Profile (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_splits` — Fitbit - Workout Splits (Wear OS) *(module: fitbit)*
- `get_fitbit_wearos_workouts` — Fitbit - Workouts (Wear OS) *(module: fitbit)*

**Garmin** (29)

- `get_poly_api` — Garmin - API Activities *(module: GarminPolyAPI)*
- `get_garmin_cache_db_activities` — Garmin - Cache DB Activities *(module: garmin)*
- `get_garmin_devices` — Garmin - Devices *(module: garmin)*
- `get_garminFB` — Garmin - Facebook Account *(module: GarminFacebook)*
- `get_garmin_gcm_cache_activities` — Garmin - GCM Cache Activities *(module: garmin)*
- `get_log` — Garmin - Matching Log Lines *(module: GarminLog)*
- `get_garmin_notification_details` — Garmin - Notification Details *(module: garmin)*
- `get_garmin_notifications` — Garmin - Notifications *(module: GarminNotifications)*
- `get_presisted` — Garmin - Persistent *(module: GarminPersistent)*
- `get_garmin_polyline` — Garmin - Polyline Activities *(module: GarminPolyline)*
- `get_garmin_sleep_activities` — Garmin - Sleep Activities *(module: garmin)*
- `get_garmin_sync` — Garmin - Sync *(module: GarminSync)*
- `get_garminUP` — Garmin - User Preferences *(module: GarminUser)*
- `get_garmin_weather` — Garmin - Weather *(module: garmin)*
- `get_act_api` — GarminActAPI *(module: GarminActAPI)*
- `get_garmin_activities` — GarminActivities *(module: GarminActivities)*
- `get_garmin_chart` — GarminCharts *(module: GarminChart)*
- `get_garmin_dailies` — GarminDailies *(module: GarminDailies)*
- `get_dailies_api` — GarminDailiesAPI *(module: GarminDailiesAPI)*
- `get_garmin_gcm_json_activities` — GarminGcmJsonActivities *(module: GarminGcmJsonActivities)*
- `get_hr_api` — GarminHRAPI *(module: GarminHRAPI)*
- `get_garmin_json` — GarminJson *(module: GarminJson)*
- `get_garmin_response` — GarminResponse *(module: GarminResponse)*
- `get_garmin_sleep` — GarminSleep *(module: GarminSleep)*
- `get_sleep_api` — GarminSleepAPI *(module: GarminSleepAPI)*
- `get_garmin_spo2` — GarminSPO2 *(module: GarminSPo2)*
- `get_steps_api` — GarminStepsAPI *(module: GarminStepsAPI)*
- `get_stress_api` — GarminStressAPI *(module: GarminStressAPI)*
- `get_garmin_weight` — GarminWeight *(module: GarminWeight)*

**Google Fit** (1)

- `googleFitGMS` — Google Fit (GMS) - Activity Sessions *(module: googleFitGMS)*

**Health Connect** (13)

- `healthconnect_access_logs` — Health Connect - Access Logs *(module: healthConnect)*
- `healthconnect_activity` — Health Connect - Activity Records *(module: healthConnect)*
- `healthconnect_apps` — Health Connect - Apps *(module: healthConnect)*
- `healthconnect_change_logs` — Health Connect - Change Logs *(module: healthConnect)*
- `healthconnect_exercise_route` — Health Connect - Exercise Route *(module: healthConnect)*
- `healthconnect_exercise` — Health Connect - Exercise Sessions *(module: healthConnect)*
- `healthconnect_heart_rate` — Health Connect - Heart Rate Samples *(module: healthConnect)*
- `healthconnect_measurements` — Health Connect - Measurements *(module: healthConnect)*
- `healthconnect_first_grants` — Health Connect - Permission First Grant Times *(module: healthConnect)*
- `healthconnect_preferences` — Health Connect - Preferences *(module: healthConnect)*
- `healthconnect_read_access_logs` — Health Connect - Read Access Logs *(module: healthConnect)*
- `healthconnect_sleep` — Health Connect - Sleep Sessions *(module: healthConnect)*
- `healthconnect_sleep_stages` — Health Connect - Sleep Stages *(module: healthConnect)*

**Hive** (1)

- `hive_boxes` — Hive - Boxes and Superseded Frames *(module: hiveBoxes)*

**Loop Habit Tracker** (2)

- `loop_habits_checkins` — Loop Habit Tracker - Check-ins *(module: loopHabits)*
- `loop_habits` — Loop Habit Tracker - Habits *(module: loopHabits)*

**Map My Walk** (1)

- `get_mmw_activities` — Map My Walk - Activities *(module: MMWActivities)*

**Map-My-Walk** (1)

- `get_map_users` — MapUsers *(module: MMWUsers)*

**Nike-Run** (4)

- `get_nike_activities` — Nike - Activities *(module: NikeActivities)*
- `get_nike_activMoments` — Nike - Activity Moments *(module: NikeAMoments)*
- `get_nike_polyline` — Nike - Activity Route *(module: NikePolyline)*
- `get_nike_notifications` — NikeNotifications *(module: NikeNotifications)*

**OpenTracks** (3)

- `opentracks_markers` — OpenTracks - Markers *(module: openTracks)*
- `opentracks_trackpoints` — OpenTracks - Trackpoints *(module: openTracks)*
- `opentracks_tracks` — OpenTracks - Tracks *(module: openTracks)*

**Runkeeper** (2)

- `get_run_activities` — Runkeeper - Activities *(module: RunkeeperActivities)*
- `get_run_user` — RunkeeperUser *(module: RunkeeperUser)*

**Sleep as Android** (2)

- `sleepasandroid_alarms` — Sleep as Android - Alarms *(module: sleepAsAndroid)*
- `sleepasandroid_records` — Sleep as Android - Sleep Records *(module: sleepAsAndroid)*

**Slopes** (3)

- `get_slopes_actions` — Slopes - Actions *(module: slopes)*
- `get_slopes_lift` — Slopes - Lift Details *(module: slopes)*
- `get_slopes` — Slopes - Resort Details *(module: slopes)*

**Speedtest** (3)

- `speedtest_reports_location` — Speedtest Reports - Location *(module: speedtest)*
- `speedtest_reports_wifi` — Speedtest Reports - Wi-Fi data *(module: speedtest)*
- `speedtest_tests` — Speedtest Test Results *(module: speedtest)*

**Strava** (1)

- `get_gps` — Strava - Activities *(module: StravaGPS)*

**Withings Health Mate** (7)

- `healthmate_accounts` — Health Mate - Accounts *(module: WithingsHealthMate)*
- `healthmate_devices` — Health Mate - Devices *(module: WithingsHealthMate)*
- `healthmate_contacts` — Health Mate - Leaderboard *(module: WithingsHealthMate)*
- `healthmate_locations` — Health Mate - Locations *(module: WithingsHealthMate)*
- `healthmate_measurements` — Health Mate - Measurements *(module: WithingsHealthMate)*
- `healthmate_messages` — Health Mate - Messages *(module: WithingsHealthMate)*
- `healthmate_trackings` — Health Mate - Trackings *(module: WithingsHealthMate)*

**Zepp Life** (1)

- `extract_zepplife_heartrate` — Zepp Life - Heart Rate *(module: zepplife)*

</details>

## Mídia, fotos e documentos

`09_midia_fotos` — 130 artefatos. Galerias, players, editores, leitores e notas.

<details>
<summary>Categorias (47) e módulos</summary>


**Adobe Acrobat Reader** (9)

- `adobe_reader_account` — Adobe Acrobat Reader - Account *(module: adobeReader)*
- `adobe_reader_ai_conversations` — Adobe Acrobat Reader - AI Assistant Conversations *(module: adobeReader)*
- `adobe_reader_comments` — Adobe Acrobat Reader - Comment Notifications *(module: adobeReader)*
- `adobe_reader_document_cloud` — Adobe Acrobat Reader - Document Cloud *(module: adobeReader)*
- `adobe_reader_thumbnails` — Adobe Acrobat Reader - Document Thumbnails *(module: adobeReader)*
- `adobe_reader_documents` — Adobe Acrobat Reader - Documents *(module: adobeReader)*
- `adobe_reader_recent_files` — Adobe Acrobat Reader - Recent Files *(module: adobeReader)*
- `adobe_reader_shared_documents` — Adobe Acrobat Reader - Shared Documents *(module: adobeReader)*
- `adobe_reader_tool_usage` — Adobe Acrobat Reader - Tool Usage *(module: adobeReader)*

**AntennaPod** (2)

- `antennapod_episodes` — AntennaPod - Episodes *(module: antennaPod)*
- `antennapod_subscriptions` — AntennaPod - Subscriptions *(module: antennaPod)*

**Aves Gallery** (2)

- `aves_entries` — Aves Gallery - Catalogued Media *(module: avesGallery)*
- `aves_trash_vaults` — Aves Gallery - Trash and Vaults *(module: avesGallery)*

**Calendar** (3)

- `get_calendar_calendars` — Calendar - Calendars *(module: googleCalendar)*
- `get_calendar` — Calendar - Events *(module: googleCalendar)*
- `googleCalendarAppEvents` — Google Calendar App Events *(module: googleCalendar)*

**CamScanner** (2)

- `camscanner_documents` — CamScanner Documents *(module: camScanner)*
- `camscanner_pages` — CamScanner Pages *(module: camScanner)*

**CapCut** (2)

- `capcut_app_sessions` — CapCut - App Sessions *(module: capCut)*
- `capcut_device` — CapCut - Device and Install *(module: capCut)*

**Catima** (1)

- `catima_cards` — Catima - Loyalty Cards *(module: catima)*

**CNN** (2)

- `cnnAndroidSearches` — CNN - Searches *(module: cnn)*
- `cnnAndroidArticles` — CNN - Stored Article Identifiers *(module: cnn)*

**ColorNote** (1)

- `colornote_notes` — ColorNote Notes *(module: colorNote)*

**Disney+** (10)

- `disneyplus_app_settings` — Disney+ - App Settings and State *(module: disneyPlus)*
- `disneyplus_last_played` — Disney+ - Bookmarks Handshake Values *(module: disneyPlus)*
- `disneyplus_cached_content` — Disney+ - Cached Content Responses *(module: disneyPlus)*
- `disneyplus_cached_images` — Disney+ - Cached Image Stores *(module: disneyPlus)*
- `disneyplus_playback_requests` — Disney+ - Playback Requests *(module: disneyPlus)*
- `disneyplus_resume_points` — Disney+ - Playback Resume Points *(module: disneyPlus)*
- `disneyplus_recent_searches` — Disney+ - Recent Searches *(module: disneyPlus)*
- `disneyplus_sdk_events` — Disney+ - SDK Events *(module: disneyPlus)*
- `disneyplus_session` — Disney+ - Session State *(module: disneyPlus)*
- `disneyplus_trickplay` — Disney+ - Trickplay Preview *(module: disneyPlus)*

**DJI Drone** (3)

- `djiFlightRecordDatGps` — DJI Drone - Flight GPS Track (MCDatFlightRecords) *(module: djiFlightRecords)*
- `djiFlightRecordTxtSummary` — DJI Drone - TXT Flight Log Summary *(module: djiFlightRecordTxt)*
- `djiFlightRecordTxtRecords` — DJI Drone - TXT Flight Records *(module: djiFlightRecordTxt)*

**Easy Voice Recorder** (2)

- `easyvoicerecorder_library` — Easy Voice Recorder Library *(module: easyVoiceRecorder)*
- `easyvoicerecorder_settings` — Easy Voice Recorder Settings *(module: easyVoiceRecorder)*

**Feeder** (2)

- `feeder_articles` — Feeder - Articles *(module: feeder)*
- `feeder_feeds` — Feeder - Subscribed Feeds *(module: feeder)*

**Flipboard** (2)

- `flipboard_article_history` — Flipboard Article History *(module: flipboard)*
- `flipboard_sections` — Flipboard Section Entries *(module: flipboard)*

**Fossify Calendar** (1)

- `fossify_calendar_events` — Fossify Calendar - Events *(module: fossifyCalendar)*

**Fossify Gallery** (1)

- `fossify_gallery_media` — Fossify Gallery - Media *(module: fossifyGallery)*

**Fossify Notes** (1)

- `fossify_notes` — Fossify Notes *(module: fossifyNotes)*

**Google Keep** (2)

- `get_googleKeepNotes` — Google Keep - Notes *(module: googleKeepNotes)*
- `get_googleKeepNotes_sharing` — Google Keep - Notes Sharing *(module: googleKeepNotes)*

**Google Keep Notes** (1)

- `get_keepNotes` — Google Keep Notes *(module: keepNotes)*

**Google Photos** (6)

- `get_googlePhotos_folders` — Google Photos - Backup Folders *(module: googlePhotos)*
- `get_googlePhotos_cache` — Google Photos - Cache *(module: googlePhotos)*
- `get_googlePhotos` — Google Photos - Local Media *(module: googlePhotos)*
- `get_googlePhotos_trash` — Google Photos - Local Trash *(module: googlePhotos)*
- `get_googlePhotos_remote` — Google Photos - Remote Media *(module: googlePhotos)*
- `get_googlePhotos_shared` — Google Photos - Shared Media *(module: googlePhotos)*

**Google Play Movies & TV** (1)

- `google_play_movies_account` — Google Play Movies & TV - Signed-In Accounts *(module: GooglePlayMoviesAccounts)*

**Google Tasks** (1)

- `get_googleTasks` — GoogleTasks *(module: googleTasks)*

**InShot** (2)

- `inshot_project_clips` — InShot Project Clips *(module: inshot)*
- `inshot_projects` — InShot Projects *(module: inshot)*

**Joplin** (3)

- `joplin_resources` — Joplin - Attachments *(module: joplin)*
- `joplin_notebooks` — Joplin - Notebooks *(module: joplin)*
- `joplin_notes` — Joplin - Notes *(module: joplin)*

**KMPlayer** (1)

- `kmplayer_playback` — KMPlayer Playback History *(module: kmplayer)*

**Moon+ Reader** (1)

- `moonreader_reading_sessions` — Moon+ Reader Reading Sessions *(module: moonReader)*

**Musicolet** (3)

- `musicolet_library` — Musicolet Library and Play Counts *(module: musicolet)*
- `musicolet_queues` — Musicolet Play Queues *(module: musicolet)*
- `musicolet_playlists` — Musicolet Playlists and Favorites *(module: musicolet)*

**MX Player** (2)

- `mxplayer_media_library` — MX Player Media Library *(module: mxPlayer)*
- `mxplayer_watched` — MX Player Watched Media *(module: mxPlayer)*

**Netflix** (10)

- `netflix_account` — Netflix Account and Device *(module: netflix)*
- `netflix_browse_cache` — Netflix Browse Cache *(module: netflix)*
- `netflix_artwork` — Netflix Cached Artwork *(module: netflix)*
- `netflix_logblobs` — Netflix Log Blobs *(module: netflix)*
- `netflix_offline_titles` — Netflix Offline Title Metadata *(module: netflix)*
- `netflix_bookmarks` — Netflix Playback Bookmarks *(module: netflix)*
- `netflix_playback` — Netflix Playback Events *(module: netflix)*
- `netflix_preferences` — Netflix Preferences *(module: netflix)*
- `netflix_profiles` — Netflix Profiles *(module: netflix)*
- `netflix_streaming_sessions` — Netflix Streaming Sessions *(module: netflix)*

**Notes** (1)

- `snotes` — Samsung Notes *(module: SamsungNotes)*

**Now Playing** (1)

- `get_googleNowPlaying` — GoogleNowPlaying *(module: googleNowPlaying)*

**Orgzly** (2)

- `orgzly_notebooks` — Orgzly - Notebooks *(module: orgzly)*
- `orgzly_notes` — Orgzly - Notes *(module: orgzly)*

**Podcast Addict** (1)

- `get_podcasts` — Podcast Addict *(module: PodcastAddict)*

**Poweramp** (1)

- `poweramp_library` — Poweramp Library and Play History *(module: poweramp)*

**Prime Video** (12)

- `prime_video_account_store` — Prime Video - Account Store *(module: primeVideo)*
- `prime_video_app_events` — Prime Video - App Events *(module: primeVideo)*
- `prime_video_app_settings` — Prime Video - App Settings *(module: primeVideo)*
- `prime_video_cached_titles` — Prime Video - Cached Title Data *(module: primeVideo)*
- `prime_video_cached_images` — Prime Video - Cached Title Images *(module: primeVideo)*
- `prime_video_continue_watching` — Prime Video - Continue Watching *(module: primeVideo)*
- `prime_video_downloads` — Prime Video - Downloads *(module: primeVideo)*
- `prime_video_playback_history` — Prime Video - Playback History *(module: primeVideo)*
- `prime_video_resume_points` — Prime Video - Playback Resume Points *(module: primeVideo)*
- `prime_video_profiles` — Prime Video - Profiles and Household *(module: primeVideo)*
- `prime_video_search_history` — Prime Video - Search History *(module: primeVideo)*
- `prime_video_streaming_cache` — Prime Video - Streaming Cache *(module: primeVideo)*

**QR and Barcode Scanner** (1)

- `qr_barcode_scanner_history` — QR and Barcode Scanner History *(module: qrBarcodeScanner)*

**Samsung Gallery** (1)

- `samsung_gallery_hidden_album` — Samsung Gallery Hidden Album *(module: SamsungGalleryHiddenAlbum)*

**Shazam** (6)

- `shazam_app_state` — Shazam App State *(module: shazam)*
- `shazam_cached_content` — Shazam Cached Content *(module: shazam)*
- `shazam_http_cache` — Shazam HTTP Cache *(module: shazam)*
- `shazam_offline_request_queue` — Shazam Offline Request Queue *(module: shazam)*
- `shazam_recognitions` — Shazam Recognitions *(module: shazam)*
- `shazam_tracks` — Shazam Tracks *(module: shazam)*

**Snapseed** (3)

- `snapseed_cached_images` — Snapseed Cached Images *(module: snapseed)*
- `snapseed_images` — Snapseed Images *(module: snapseed)*
- `snapseed_settings` — Snapseed Settings *(module: snapseed)*

**Spotify** (6)

- `spotify_account` — Spotify - Account *(module: Spotify)*
- `spotify_artist_profile_views` — Spotify - Cached Artist Responses *(module: Spotify)*
- `spotify_now_playing_view` — Spotify - Cached Color-Lyrics Responses *(module: Spotify)*
- `spotify_playback_activity` — Spotify - Playback Activity *(module: Spotify)*
- `spotify_playlist_library` — Spotify - Playlist Library Activity *(module: Spotify)*
- `spotify_recently_played` — Spotify - Recently Played *(module: Spotify)*

**Tasks.org** (3)

- `tasks_org_locations` — Tasks.org - Locations *(module: tasksOrg)*
- `tasks_org_reminders` — Tasks.org - Reminders *(module: tasksOrg)*
- `tasks_org_tasks` — Tasks.org - Tasks *(module: tasksOrg)*

**Todoist** (3)

- `get_Todoist` — Todoist - Items *(module: Todoist)*
- `get_Todoist_notes` — Todoist - Notes *(module: Todoist)*
- `get_Todoist_projects` — Todoist - Projects *(module: Todoist)*

**Twitch** (1)

- `twitch_account` — Twitch - Account and Device *(module: twitch)*

**VivaVideo** (3)

- `vivavideo_export_attempts` — VivaVideo Export Attempts *(module: vivaVideo)*
- `vivavideo_project_media` — VivaVideo Project Media *(module: vivaVideo)*
- `vivavideo_projects` — VivaVideo Projects *(module: vivaVideo)*

**Wikipedia** (2)

- `wikipedia_reading_history` — Wikipedia - Reading History *(module: wikipedia)*
- `wikipedia_search_history` — Wikipedia - Search History *(module: wikipedia)*

**Xodo PDF** (1)

- `xodo_recent_documents` — Xodo PDF Recent Documents *(module: xodo)*

**YouCam Perfect** (3)

- `youcam_perfect_app_state` — YouCam Perfect App State *(module: youCamPerfect)*
- `youcam_perfect_images` — YouCam Perfect Images *(module: youCamPerfect)*
- `youcam_perfect_saved_photos` — YouCam Perfect Saved Photos *(module: youCamPerfect)*

</details>

## E-mail e produtividade

`10_email_produtividade` — 96 artefatos. Clientes de e-mail, nuvem, arquivos e conexões.

<details>
<summary>Categorias (28) e módulos</summary>


**Bluetooth** (1)

- `get_bluetooth_opp` — Bluetooth File Transfers *(module: bluetoothOpp)*

**Bluetooth Connections** (2)

- `get_bluetoothAdapter` — Bluetooth Adapter Information *(module: bluetoothConnections)*
- `get_bluetoothConnections` — Bluetooth Connections *(module: bluetoothConnections)*

**Cast** (1)

- `googleCast` — Google Cast *(module: googleCast)*

**Cloud Storage** (1)

- `microsoft_onedrive` — Microsoft OneDrive *(module: microsoft_onedrive)*

**Device Connections** (2)

- `adb_authorizations` — ADB Authorizations *(module: adbAuthorizations)*
- `telecom_phone_accounts` — Telecom Phone Accounts *(module: telecomPhoneAccounts)*

**Downloads** (1)

- `downloads` — Native Downloads *(module: downloads)*

**Dropbox** (3)

- `dropbox_account` — Dropbox - Account *(module: dropbox)*
- `dropbox_files` — Dropbox - Files *(module: dropbox)*
- `dropbox_thumbnails` — Dropbox - Thumbnails *(module: dropbox)*

**Email** (5)

- `gmailEmails` — Gmail - App Emails *(module: gmailEmails)*
- `gmailDownloadRequests` — Gmail - Download Requests *(module: gmailEmails)*
- `gmailIMAPAccounts` — Gmail - IMAP Accounts *(module: gmailIMAPEmails)*
- `gmailIMAPEmails` — Gmail - IMAP Mailbox Emails *(module: gmailIMAPEmails)*
- `gmailLabels` — Gmail - Label Details *(module: gmailEmails)*

**Etc Hosts** (1)

- `get_etc_hosts` — Etc_hosts *(module: etc_hosts)*

**FairCode FairEmail App** (3)

- `get_fair_mail_accounts` — FairEmail - Accounts *(module: FairEmail)*
- `get_fair_mail_contacts` — FairEmail - Contacts *(module: FairEmail)*
- `get_fair_mail_messages` — FairEmail - Messages *(module: FairEmail)*

**File Transfer** (4)

- `get_shareit` — shareit *(module: shareit)*
- `get_Xender` — Xender - Connected Devices *(module: Xender)*
- `get_Xender_messages` — Xender - Messages *(module: Xender)*
- `get_Zapya` — Zapya *(module: Zapya)*

**Gmail** (1)

- `get_gmailActive` — GmailActive *(module: gmail)*

**Google Drive** (2)

- `get_Cello` — Cello - Google Drive *(module: Cello)*
- `get_DocList` — DocList *(module: DocList)*

**K-9 Mail** (2)

- `get_k9mail_accounts` — K-9 Mail - Accounts *(module: K9Mail)*
- `get_k9mail_messages` — K-9 Mail - Messages *(module: K9Mail)*

**MS Authenticator** (1)

- `get_MSAuth_accounts` — Microsoft Authenticator - Accounts *(module: MicrosoftAuthenticator)*

**My Files** (18)

- `get_smyFiles` — My Files - Download History *(module: smyFiles)*
- `get_smyFiles2` — My Files - Download History (FileInfo) *(module: smyFiles2)*
- `get_smyFiles_legacy` — My Files - Download History (Legacy) *(module: smyFiles)*
- `get_smyfiles_operations` — My Files - File Operations *(module: smyfilesMetadata)*
- `get_smyfiles_frequent_folders` — My Files - Frequent Folders *(module: smyfilesMetadata)*
- `get_smyFiles2_gdrive` — My Files - Google Drive *(module: smyFiles2)*
- `get_smyfiles_home_items` — My Files - Home Items *(module: smyfilesMetadata)*
- `get_smyfiles_local_files` — My Files - Local Files *(module: smyfilesMetadata)*
- `get_smyfilesRecents` — My Files - Recent Files *(module: smyfilesRecents)*
- `get_smyfilesRecents_fileinfo` — My Files - Recent Files (FileInfo) *(module: smyfilesRecents)*
- `get_smyFiles_recent` — My Files - Recent Files (MyFiles DB) *(module: smyFiles)*
- `get_smyfiles_search_history` — My Files - Search History *(module: smyfilesMetadata)*
- `get_smyfiles_analyze_storage` — My Files - Storage Analysis *(module: smyfilesMetadata)*
- `get_smyfiles_trash_apps` — My Files - Trash by App *(module: smyfilesMetadata)*
- `get_smyfilescache` — My Files Cache *(module: smyfilescache)*
- `get_smyfiles_OpHistory` — My Files Operation History *(module: smyfilesOpHistory)*
- `get_smyfiles_trash` — My Files Trash *(module: smyfilesTrash)*
- `get_smyfilesStored` — smyfilesStored *(module: smyfilesStored)*

**Nearby** (2)

- `nearby_discovery` — Nearby - Discovered Items *(module: nearbyDevices)*
- `nearby_fast_pair` — Nearby - Fast Pair Devices *(module: nearbyDevices)*

**Network Usage** (1)

- `netstats` — Netstats *(module: netstats)*

**Outlook** (4)

- `outlook_accounts` — Outlook - Accounts *(module: outlook)*
- `outlook_app_versions` — Outlook - App Version History *(module: outlook)*
- `outlook_installation` — Outlook - Installation *(module: outlook)*
- `outlook_settings` — Outlook - Settings *(module: outlook)*

**Phone Link** (3)

- `phonelink_content_access` — Phone Link - Content Access Events *(module: phoneLink)*
- `phonelink_accounts` — Phone Link - Linked Accounts *(module: phoneLink)*
- `phonelink_phone_apps` — Phone Link - Linked Phone Apps *(module: phoneLink)*

**Proton Drive** (2)

- `protondrive_fileinfo` — Proton Drive - File Info *(module: ProtonDrive)*
- `protondrive_useraccount` — Proton Drive - User Account *(module: ProtonDrive)*

**ProtonMail** (10)

- `get_protonmail_contacts` — ProtonMail - Contacts *(module: protonmail)*
- `protonmailInboxAccount` — ProtonMail - Inbox Account *(module: protonmailInbox)*
- `protonmailInboxAttachments` — ProtonMail - Inbox Attachments *(module: protonmailInbox)*
- `protonmailInboxContacts` — ProtonMail - Inbox Contacts *(module: protonmailInbox)*
- `protonmailInboxMessages` — ProtonMail - Inbox Messages *(module: protonmailInbox)*
- `protonmailDbMailAccount` — ProtonMail - MailX Account *(module: protonmailDbMail)*
- `protonmailDbMailAttachments` — ProtonMail - MailX Attachments *(module: protonmailDbMail)*
- `protonmailDbMailContacts` — ProtonMail - MailX Contacts *(module: protonmailDbMail)*
- `protonmailDbMailMessages` — ProtonMail - MailX Messages *(module: protonmailDbMail)*
- `get_protonmail_messages` — ProtonMail - Messages *(module: protonmail)*

**Samsung Continuity Service** (2)

- `samsungSleepScreenData` — Samsung Sleep Detection Screen Data *(module: samsungSleepDetection)*
- `samsungSleepTime` — Samsung Sleep Detection Sleep Times *(module: samsungSleepDetection)*

**Samsung Smart Switch** (8)

- `smartswitch_backup_media` — Samsung Smart Switch - Backup Media Table (bkmedia) *(module: samsungSmartSwitch)*
- `smartswitch_peer_accounts` — Samsung Smart Switch - Peer Accounts *(module: samsungSmartSwitch)*
- `smartswitch_peer_apps` — Samsung Smart Switch - Peer App Categories *(module: samsungSmartSwitch)*
- `smartswitch_peer_contacts` — Samsung Smart Switch - Peer Contact Accounts *(module: samsungSmartSwitch)*
- `smartswitch_peer_messages` — Samsung Smart Switch - Peer Message Counts *(module: samsungSmartSwitch)*
- `smartswitch_sessions` — Samsung Smart Switch - Transfer Sessions *(module: samsungSmartSwitch)*
- `smartswitch_items` — Samsung Smart Switch - Transferred Data Categories *(module: samsungSmartSwitch)*
- `smartswitch_transferred_history` — Samsung Smart Switch - Transferred History *(module: samsungSmartSwitch)*

**Thunderbird App** (2)

- `thunderbird_accounts` — Thunderbird - Accounts *(module: thunderbird)*
- `thunderbird_messages` — Thunderbird - Messages *(module: thunderbird)*

**Tutanota** (3)

- `tutanota_accounts` — Tutanota - Accounts *(module: tutanota)*
- `tutanota_configuration` — Tutanota - App Configuration *(module: tutanota)*
- `tutanota_calendar_alarms` — Tutanota - Calendar Alarms *(module: tutanota)*

**WiFi Profiles** (6)

- `samsungTcpMonitorApInfo` — Samsung Wi-Fi - Networks and Foreground Apps *(module: samsungTcpMonitorApInfo)*
- `samsungWifiConfigStoreDb` — Samsung WiFi Config Store DB *(module: samsungWifiDatabases)*
- `ipMemoryStore` — Wi-Fi IP Memory Store *(module: ipMemoryStore)*
- `get_wifiConfigstore` — WiFi Config Store *(module: wifiConfigstore2)*
- `get_wifiHotspot` — wifiHotspot *(module: wifiHotspot)*
- `get_wifiProfiles` — wifiProfiles *(module: wifiProfiles)*

**Yahoo Mail** (5)

- `yahoo_mail_accounts` — Yahoo Mail - Accounts and Device *(module: yahooMail)*
- `yahoo_mail_app_usage` — Yahoo Mail - App Usage *(module: yahooMail)*
- `yahoo_mail_contacts` — Yahoo Mail - Contacts *(module: yahooMail)*
- `yahoo_mail_folders` — Yahoo Mail - Folders *(module: yahooMail)*
- `yahoo_mail_messages` — Yahoo Mail - Messages *(module: yahooMail)*

</details>

## Finanças e comércio

`11_financas_comercio` — 57 artefatos. Carteiras, bancos, pagamentos, compras e cofres de senhas.

<details>
<summary>Categorias (17) e módulos</summary>


**Aegis** (2)

- `aegis_entries` — Aegis - Entries *(module: aegis)*
- `aegis_vault` — Aegis - Vault *(module: aegis)*

**Amazon Shopping** (4)

- `get_amazon_account_store` — Amazon Shopping - Account Store *(module: amazonShopping)*
- `get_amazon_image_cache_registry` — Amazon Shopping - Image Cache Registry *(module: amazonShopping)*
- `get_amazon_preferences` — Amazon Shopping - Preferences *(module: amazonShopping)*
- `get_amazon_webview_state` — Amazon Shopping - Web View State *(module: amazonShopping)*

**Bitwarden** (2)

- `bitwarden_account` — Bitwarden - Account *(module: bitwarden)*
- `bitwarden_vault_items` — Bitwarden - Vault Items *(module: bitwarden)*

**BRD (BreadWallet)** (4)

- `breadwallet_app_state` — BRD (BreadWallet) - App State *(module: breadWallet)*
- `breadwallet_exchange_rates` — BRD (BreadWallet) - Cached Exchange Rates *(module: breadWallet)*
- `breadwallet_kv_store` — BRD (BreadWallet) - Key-Value Store *(module: breadWallet)*
- `breadwallet_transaction_metadata` — BRD (BreadWallet) - Transaction Metadata Records *(module: breadWallet)*

**Cash App** (1)

- `get_cashApp` — Cash App *(module: cashApp)*

**eBay** (11)

- `ebay_accounts` — eBay - Accounts *(module: ebay)*
- `ebay_app_configuration` — eBay - App Configuration *(module: ebay)*
- `ebay_app_sessions` — eBay - App Sessions *(module: ebay)*
- `ebay_app_state` — eBay - App State *(module: ebay)*
- `ebay_cached_images` — eBay - Cached Images *(module: ebay)*
- `ebay_followed_searches` — eBay - Followed Searches *(module: ebay)*
- `ebay_followed_sellers` — eBay - Followed Sellers *(module: ebay)*
- `ebay_recent_searches` — eBay - Recent Searches *(module: ebay)*
- `ebay_search_suggestions` — eBay - Search Suggestions *(module: ebay)*
- `ebay_share_channels` — eBay - Share Channels *(module: ebay)*
- `ebay_watch_list` — eBay - Watch List *(module: ebay)*

**Etsy** (7)

- `etsy_account` — Etsy - Account and Device *(module: etsy)*
- `etsy_ad_impressions` — Etsy - Ad Impressions and Clicks *(module: etsy)*
- `etsy_app_logs` — Etsy - Application Logs *(module: etsy)*
- `etsy_image_caches` — Etsy - Image Cache Summary *(module: etsy)*
- `etsy_listing_interactions` — Etsy - Listing Interactions *(module: etsy)*
- `etsy_network_breadcrumbs` — Etsy - Network Breadcrumbs *(module: etsy)*
- `etsy_recently_viewed` — Etsy - Recently Viewed Listings *(module: etsy)*

**Google Pay** (2)

- `get_googlePay_transactions` — Google Pay Transactions *(module: googlePay)*
- `get_googlePay_upi_ids` — Google Pay UPI IDs *(module: googlePay)*

**KeePassDX** (1)

- `keepassdx_database_history` — KeePassDX - Database History *(module: keepassDX)*

**Kijiji** (3)

- `get_kijijiConversations` — kijijiConversations *(module: kijijiConversations)*
- `get_kijijiLocalUserInfo` — kijijiLocalUserInfo *(module: kijijiLocalUserInfo)*
- `get_kijijiRecentSearches` — kijijiRecentSearches *(module: kijijiRecentSearches)*

**kleinanzeigen.de App** (5)

- `get_kleinanzeigenmessagebox` — kleinanzeigen.de - Messagebox *(module: kleinanzeigen.de)*
- `get_kleinanzeigenmessages` — kleinanzeigen.de - Messages *(module: kleinanzeigen.de)*
- `get_kleinanzeigennonresettablerecentsearchescache` — kleinanzeigen.de - Non resettable Recent Searches Cache *(module: kleinanzeigen.de)*
- `get_kleinanzeigenrecentsearchescache` — kleinanzeigen.de - Recent Searches Cache *(module: kleinanzeigen.de)*
- `get_kleinanzeigenaccount` — kleinanzeigen.de App - Account Details *(module: kleinanzeigen.de)*

**PayPal** (2)

- `paypal_app_sessions` — PayPal - App Sessions *(module: payPal)*
- `paypal_device` — PayPal - Device and Encrypted Stores *(module: payPal)*

**Rema1000 | Scan Selv** (2)

- `rema1000_receipt_prettified` — Rema1000 Receipts, prettified *(module: rema_1000)*
- `rema1000_receipt_raw` — Rema1000 Receipts, raw *(module: rema_1000)*

**Revolut** (2)

- `revolut_app_state` — Revolut - App State *(module: revolut)*
- `revolut_payment_recipients` — Revolut - Recent Payment Recipients *(module: revolut)*

**Samsung Wallet** (3)

- `samsung_wallet_card_art` — Samsung Wallet - Card Art *(module: Samsungwallet)*
- `samsung_wallet_cards` — Samsung Wallet - Enrolled Cards *(module: Samsungwallet)*
- `samsung_wallet_receipts` — Samsung Wallet - Receipts *(module: Samsungwallet)*

**Verizon RDD Analytics** (2)

- `get_rdd_analytics` — VerizonRDD-Battery *(module: VerizonRDDAnalytics)*
- `get_rdd_wifi` — VerizonRDD-WIFI *(module: VerizonRDDWIFI)*

**Vinted** (4)

- `vinted_items` — Vinted - Cached Listings *(module: vinted)*
- `vinted_favorites` — Vinted - Favourited Listings *(module: vinted)*
- `vinted_feedbacks` — Vinted - Feedback *(module: vinted)*
- `vinted_session` — Vinted - Session and Locale *(module: vinted)*

</details>

## Armazenamento seguro e cofres

`12_armazenamento_seguro` — 84 artefatos. Cofres de mídia, apps bloqueados e diretórios ocultos.

<details>
<summary>Categorias (18) e módulos</summary>


**Calculator Lock** (9)

- `calculatorvault_browser_history` — Calculator Lock - Browser History *(module: calculatorLockVault)*
- `calculatorvault_calculator_history` — Calculator Lock - Calculator History *(module: calculatorLockVault)*
- `calculatorvault_contacts` — Calculator Lock - Contacts *(module: calculatorLockVault)*
- `calculatorvault_deleted_data` — Calculator Lock - Deleted Data *(module: calculatorLockVault)*
- `calculatorvault_files` — Calculator Lock - Files *(module: calculatorLockVault)*
- `calculatorvault_hidden_files` — Calculator Lock - Hidden Files *(module: calculatorLockVault)*
- `calculatorvault_notes` — Calculator Lock - Notes *(module: calculatorLockVault)*
- `calculatorvault_preferences` — Calculator Lock - Preferences *(module: calculatorLockVault)*
- `calculatorvault_storage_media` — Calculator Lock - Storage Folder Media *(module: calculatorLockVault)*

**Encrypting Media Apps** (11)

- `get_appLockerfishingnet` — App Locker *(module: appLockerfishingnet)*
- `get_appLockerfishingnetpat` — App Locker - Stored Preference *(module: appLockerfishingnetpat)*
- `hld_privacy_safe_albums` — HLD Vault - Albums *(module: hldPrivacySafe)*
- `hld_privacy_safe_files` — HLD Vault - Hidden Files *(module: hldPrivacySafe)*
- `hld_privacy_safe_preferences` — HLD Vault - Preferences *(module: hldPrivacySafe)*
- `get_NQVault` — NQ Vault - Hash Candidates *(module: NQ_Vault)*
- `get_NQVault_media` — NQ Vault - XOR Media *(module: NQ_Vault)*
- `get_playgroundVault` — Playground Vault *(module: playgroundVault)*
- `get_AVG_inventory` — Vault Candidate Input Inventory (AVG Decoder) *(module: AVG)*
- `get_AVG` — Vault Candidates - Encryption Details (AVG Decoder) *(module: AVG)*
- `get_AVG_media` — Vault Candidates - Media (AVG Decoder) *(module: AVG)*

**File Commander** (2)

- `file_commander_favorites` — File Commander Favorites *(module: fileCommander)*
- `file_commander_recycle_bin` — File Commander Recycle Bin *(module: fileCommander)*

**File Manager** (2)

- `filemanagerplus_thumbnails` — Cx File Explorer and File Manager+ Cached Thumbnails *(module: fileManagerPlus)*
- `filemanagerplus_scanned_folders` — Cx File Explorer and File Manager+ Scanned Folders *(module: fileManagerPlus)*

**Files By Google** (2)

- `fbg_master` — Files By Google - Files Master *(module: FilesByGoogle)*
- `fbg_searchhistory` — Files By Google - Search History *(module: FilesByGoogle)*

**Gallery Trash** (1)

- `get_galleryTrash` — Gallery Trash *(module: galleryTrash)*

**GalleryVault** (20)

- `galleryvault_account_profile` — GalleryVault - Account Profile *(module: galleryVault)*
- `galleryvault_applock_break_ins` — GalleryVault - AppLock Break-in Reports *(module: galleryVault)*
- `galleryvault_break_in_images` — GalleryVault - Break-in Report Images *(module: galleryVault)*
- `galleryvault_break_in_reports` — GalleryVault - Break-in Reports *(module: galleryVault)*
- `galleryvault_browser_history` — GalleryVault - Browser History *(module: galleryVault)*
- `galleryvault_browser_urls` — GalleryVault - Browser Start Pages *(module: galleryVault)*
- `galleryvault_cloud_account` — GalleryVault - Cloud Account *(module: galleryVault)*
- `galleryvault_cloud_change_history` — GalleryVault - Cloud Change History *(module: galleryVault)*
- `galleryvault_cloud_files` — GalleryVault - Cloud Files *(module: galleryVault)*
- `galleryvault_cloud_folders` — GalleryVault - Cloud Folders *(module: galleryVault)*
- `galleryvault_cloud_upload_tasks` — GalleryVault - Cloud Upload Tasks *(module: galleryVault)*
- `galleryvault_downloads` — GalleryVault - Downloads *(module: galleryVault)*
- `galleryvault_file_actions` — GalleryVault - File Action Log *(module: galleryVault)*
- `galleryvault_folders` — GalleryVault - Folders *(module: galleryVault)*
- `galleryvault_hidden_files` — GalleryVault - Hidden Files (database) *(module: galleryVault)*
- `galleryvault_locked_apps` — GalleryVault - Locked Apps *(module: galleryVault)*
- `galleryvault_preferences` — GalleryVault - Preferences *(module: galleryVault)*
- `galleryvault_recycle_bin` — GalleryVault - Recycle Bin *(module: galleryVault)*
- `galleryvault_unhide_history` — GalleryVault - Unhide and Export History *(module: galleryVault)*
- `galleryvault_vault_files` — GalleryVault - Vault Files *(module: galleryVault)*

**KeepSafe** (5)

- `keepsafe_account` — KeepSafe - Account & Preferences *(module: KeepSafe)*
- `keepsafe_albums` — KeepSafe - Albums *(module: KeepSafe)*
- `keepsafe_breakins` — KeepSafe - Break-in Records *(module: KeepSafe)*
- `keepsafe_browser` — KeepSafe - Browser Tabs *(module: KeepSafe)*
- `keepsafe_media` — KeepSafe - Media Files *(module: KeepSafe)*

**Knox Secure Folder** (1)

- `samsungSecureFolderHistoryLog` — Samsung Secure Folder - History Log *(module: samsungSecureFolderHistoryLog)*

**Linkbox** (1)

- `linkbox_uploads` — Linkbox - Uploads *(module: linkbox)*

**Mega** (4)

- `get_mega` — mega *(module: mega)*
- `mega_cached_media` — MEGA - Cached Media *(module: megaCloud)*
- `mega_cloud_files` — MEGA - Cloud Files *(module: megaCloud)*
- `get_mega_transfers` — mega_transfers *(module: mega_transfers)*

**PikPak** (3)

- `get_pikpakCloudlist` — PikPak Cloud List *(module: pikpakCloudlist)*
- `get_pikpakDownloads` — PikPak Downloads *(module: pikpakDownloads)*
- `get_pikpakPlay` — PikPak Play *(module: pikpakPlay)*

**Private Photo Vault** (3)

- `private_photo_vault_account` — Private Photo Vault - Account Usage *(module: PrivatePhotoVault)*
- `private_photo_vault_albums` — Private Photo Vault - Albums *(module: PrivatePhotoVault)*
- `private_photo_vault_media` — Private Photo Vault - Media *(module: PrivatePhotoVault)*

**Seal** (2)

- `seal_config` — Seal - Cookies and Templates *(module: seal)*
- `seal_downloads` — Seal - Downloaded Media *(module: seal)*

**Solid Explorer** (5)

- `solid_explorer_bookmarks` — Solid Explorer Bookmarks *(module: solidExplorer)*
- `solid_explorer_connections` — Solid Explorer Connections *(module: solidExplorer)*
- `solid_explorer_folders_viewed` — Solid Explorer Folders Viewed *(module: solidExplorer)*
- `solid_explorer_recent_files` — Solid Explorer Recent Files *(module: solidExplorer)*
- `solid_explorer_searches` — Solid Explorer Searches *(module: solidExplorer)*

**Trash** (1)

- `samsungTrash` — Samsung Trash *(module: SamsungTrash)*

**Vaulty** (2)

- `get_vaulty_files` — vaulty_files *(module: vaulty_files)*
- `get_vaulty_info` — vaulty_info *(module: vaulty_info)*

**Yandex Disk** (10)

- `yandex_disk_accounts` — Yandex Disk Accounts *(module: yandexDisk)*
- `yandex_disk_cloud_files` — Yandex Disk Cloud Files *(module: yandexDisk)*
- `yandex_disk_downloads` — Yandex Disk Downloads *(module: yandexDisk)*
- `yandex_disk_image_cache` — Yandex Disk Image Cache *(module: yandexDisk)*
- `yandex_disk_local_media` — Yandex Disk Local Media *(module: yandexDisk)*
- `yandex_disk_notes` — Yandex Disk Notes *(module: yandexDisk)*
- `yandex_disk_settings` — Yandex Disk Settings *(module: yandexDisk)*
- `yandex_disk_trash` — Yandex Disk Trash *(module: yandexDisk)*
- `yandex_disk_uploads` — Yandex Disk Uploads *(module: yandexDisk)*
- `yandex_disk_video_positions` — Yandex Disk Video Playback Positions *(module: yandexDisk)*

</details>

## IA e assistentes

`15_ia_assistentes` — 48 artefatos. Chatbots, histórico de conversas com IA e telemetria associada.

<details>
<summary>Categorias (8) e módulos</summary>


**AI Chatbot - Nova** (9)

- `nova_chatbot_conversations` — Conversations (Full Detail) *(module: AIChatbotNovaConversations)*
- `nova_chatbot_history` — History *(module: AIChatbotNovaHistory)*
- `nova_chatbot_history_detail` — HistoryDetail *(module: AIChatbotNovaHistory)*
- `nova_chatbot_documents` — HistoryDetailDocuments *(module: AIChatbotNovaHistory)*
- `nova_chatbot_images` — HistoryDetailImages *(module: AIChatbotNovaHistory)*
- `nova_chatbot_links` — HistoryDetailLinks *(module: AIChatbotNovaHistory)*
- `nova_user_submissions` — Nova Media Records *(module: AIChatbotNovaMediastore)*
- `get_nova_momo_prefs` — Shared Preferences - Account & Usage *(module: AIChatbotNovaSharedPrefs)*
- `get_nova_adapty_prefs` — Shared Preferences - Adapty Payment *(module: AIChatbotNovaSharedPrefs)*

**AI Provenance** (1)

- `get_c2paProvenance` — C2PA Content Provenance (AI Provenance) *(module: c2paProvenance)* ⚠️ desmarcado por padrão

**ALEX Live Data** (12)

- `alex_live_appops` — App Ops *(module: alex_live_data)*
- `alex_live_account` — Dumpsys - Accounts *(module: alex_live_data)*
- `alex_live_batterystats` — Dumpsys - Batterystats *(module: alex_live_data)*
- `alex_live_bt_bonded` — Dumpsys - BTM Bonded Devices *(module: alex_live_data)*
- `alex_live_companiondevice` — Dumpsys - Companiondevice *(module: alex_live_data)*
- `alex_live_wifi_conf_net` — Dumpsys - Configured Networks *(module: alex_live_data)*
- `alex_live_role` — Dumpsys - Role (Default Apps) *(module: alex_live_data)*
- `alex_live_shortcut` — Dumpsys - Shortcuts *(module: alex_live_data)*
- `alex_live_discord_shortcut` — Dumpsys - Shortcuts (Discord) *(module: alex_live_data)*
- `alex_live_usagestats_yearly` — Dumpsys - Usagestats (yearly) *(module: alex_live_data)*
- `alex_live_usagestats_events` — Dumpsys - Usagestats Events *(module: alex_live_data)*
- `alex_live_logcat` — Logcat *(module: alex_live_data)*

**ChatGPT** (10)

- `get_chatgpt_accountstatus` — ChatGPT - Account Status *(module: chatgpt)*
- `get_chatgpt_accountuserstate` — ChatGPT - Account User State *(module: chatgpt)*
- `get_chatgpt_media` — ChatGPT - Cached Media *(module: chatgpt)*
- `get_chatpgt2` — ChatGPT - Conversations *(module: chatgpt2)*
- `get_chatgpt` — ChatGPT - Conversations Metadata *(module: chatgpt)*
- `get_chatgpt_custominstructions` — ChatGPT - Custom Instructions *(module: chatgpt)*
- `get_chatgpt_conversations` — ChatGPT - Messages (Legacy) *(module: chatgpt)*
- `get_chatgpt_user` — ChatGPT - User *(module: chatgpt)*
- `get_chatgpt_analytics` — ChatGPT - User Analytics *(module: chatgpt)*
- `get_chatgpt_usersettings` — ChatGPT - User Settings *(module: chatgpt)*

**Claude** (4)

- `claudeAccountInfo` — Claude Account Information *(module: claude)*
- `claudeConversations` — Claude Conversations *(module: claude)*
- `claudeMessages` — Claude Messages *(module: claude)*
- `claudeProjects` — Claude Projects *(module: claude)*

**DeepSeek** (3)

- `deepseek_chat_info` — Deepseek Chat Info *(module: Deepseek_ChatInfo)*
- `deepseek_chat_messages` — Deepseek Chat Messages *(module: Deepseek_ChatMessages)*
- `deepseek_user_info` — Deepseek User Info *(module: Deepseek_UserInfo)*

**Google Now & QuickSearch** (7)

- `quicksearch_cached_episodes` — Google Quick Search Box - Cached Podcast Episodes *(module: googleQuickSearchboxKeyValueCache)*
- `quicksearch_cached_search_requests` — Google Quick Search Box - Cached Search Requests *(module: googleQuickSearchboxKeyValueCache)*
- `quicksearch_cached_requests` — Google Quick Search Box - Other Cached Requests *(module: googleQuickSearchboxKeyValueCache)*
- `quicksearch_personal_suggestions` — Google Quick Search Box - Personal Suggestions *(module: googleQuickSearchboxZeroPrefix)*
- `quicksearch_suggestion_caches` — Google Quick Search Box - Suggestion Cache Files *(module: googleQuickSearchboxZeroPrefix)*
- `get_quicksearch` — Google Quick Search Queries *(module: googleQuickSearchbox)*
- `get_quicksearch_recent` — Google Quick Search Recent *(module: googleQuickSearchboxRecent)*

**Grok** (2)

- `grok_useraccount` — Grok - User Account *(module: Grok)*
- `grok_generatedvideos` — Grok - Videos *(module: Grok)*

</details>

## VPN e privacidade

`16_vpn_privacidade` — 19 artefatos. Clientes VPN, números virtuais e extensões de privacidade.

<details>
<summary>Categorias (6) e módulos</summary>


**Burner** (6)

- `get_burner_communications` — Burner - Communications *(module: burner)*
- `get_burnerContacts` — Burner - Contacts *(module: burnerContacts)*
- `get_burnerMessages` — Burner - Messages *(module: burnerMessages)*
- `get_burner` — Burner - Numbers *(module: burner)*
- `get_burnerSubscription` — Burner - Subscription *(module: burnerSubscription)*
- `get_burnerUser` — Burner - User *(module: burnerUser)*

**Cloudflare WARP** (1)

- `cloudflare_warp_registration` — Cloudflare 1.1.1.1 WARP Registration and State *(module: cloudflareWarp)*

**Dust** (3)

- `dust_key_bundles` — Dust - Conversation Key Bundles *(module: dust)*
- `dust_conversations` — Dust - Conversations *(module: dust)*
- `dust_known_accounts` — Dust - Known Accounts *(module: dust)*

**NordVPN** (3)

- `nordvpn_app_events` — NordVPN - App Events *(module: nordVpn)*
- `nordvpn_settings` — NordVPN - Settings and State *(module: nordVpn)*
- `nordvpn_domains` — NordVPN - Stored Domains *(module: nordVpn)*

**ProtonVPN** (3)

- `get_protonvpn_connection_history` — ProtonVPN - Connection History *(module: protonVPN)*
- `get_protonvpn_device_info` — ProtonVPN - Device Info *(module: protonVPN)*
- `get_protonvpn_user_info` — ProtonVPN - User Info *(module: protonVPN)*

**Silent Phone** (3)

- `silentphone_account` — Silent Phone - Account and Settings *(module: silentPhone)*
- `silentphone_conversation_objects` — Silent Phone - Conversation Objects *(module: silentPhone)*
- `silentphone_zrtp_peers` — Silent Phone - ZRTP Peer Identities *(module: silentPhone)*

</details>

## Câmeras e IoT

`17_cameras_iot` — 21 artefatos. NVRs, câmeras IP e sincronização de pastas.

<details>
<summary>Categorias (4) e módulos</summary>


**Blink** (9)

- `blink_key_value_store` — Blink App Key Value Store *(module: BlinkApp)*
- `blink_app_messages` — Blink App Messages *(module: BlinkApp)*
- `blink_camera_entitlements` — Blink Camera Entitlements *(module: BlinkApp)*
- `blink_camera_information` — Blink Camera Information *(module: BlinkApp)*
- `blink_network_information` — Blink Network Information *(module: BlinkApp)*
- `blink_subscriptions` — Blink Subscriptions *(module: BlinkApp)*
- `blink_syncmodule_entitlements` — Blink Syncmodule Entitlements *(module: BlinkApp)*
- `blink_syncmodule_information` — Blink Syncmodule Information *(module: BlinkApp)*
- `blink_tracking_events` — Blink Tracking Events *(module: BlinkApp)*

**Dahua Technology (DMSS)** (6)

- `get_dmss` — Dahua CCTV - Channels *(module: dmss)*
- `get_dmss_info` — Dahua CCTV - Info *(module: dmss)*
- `get_dmss_media` — Dahua CCTV - Media *(module: dmss)*
- `get_dmss_notifications` — Dahua IoT - Notifications *(module: dmss)*
- `get_dmss_cloud` — Dahua IoT - Registered Cloud Devices *(module: dmss)*
- `get_dmss_sensors` — Dahua IoT - Registered Sensors *(module: dmss)*

**Hikvision** (4)

- `get_hikvision_activity` — Hikvision - CCTV Activity *(module: hikvision)*
- `get_hikvision` — Hikvision - CCTV Channels *(module: hikvision)*
- `get_hikvision_info` — Hikvision - CCTV Info *(module: hikvision)*
- `get_hikvision_media` — Hikvision - CCTV Media *(module: hikvision)*

**Syncthing** (2)

- `syncthing_devices` — Syncthing - Devices *(module: syncthing)*
- `syncthing_folders` — Syncthing - Folders *(module: syncthing)*

</details>

## CACHE — pintura pixel a pixel de assets

`13_cache_pesado` — 4 artefatos. Caches de navegador e imagens. Lê dezenas de milhares de arquivos pequenos.

<details>
<summary>Categorias (3) e módulos</summary>


**Browser Cache** (2)

- `get_browserCachechrome` — Chrome Browser Cache *(module: browserCachechrome)* ⚠️ lento
- `get_browserCachefirefox` — Firefox Browser Cache *(module: browserCachefirefox)* ⚠️ lento

**ExoPlayer Cache** (1)

- `exoplayerCachedMedia` — ExoPlayer - Rejoined Cached Media *(module: exoplayerCachedMedia)*

**Image Manager Cache** (1)

- `get_imagemngCache` — Image Manager Cache *(module: imagemngCache)* ⚠️ desmarcado por padrão

</details>

## Jogos e entretenimento social

`18_jogos` — 21 artefatos. Jogos com chat embutido e apps de entretenimento.

<details>
<summary>Categorias (3) e módulos</summary>


**Chats** (8)

- `get_ChessWithFriends` — Chess With Friends *(module: ChessWithFriends)*
- `knuddels_chats` — Knuddels - Chat Messages *(module: knuddels)*
- `get_meetmechats` — MeetMe Chats *(module: meetme)*
- `randochat_messages` — RandoChat Messages *(module: RandoChat)*
- `romeo_dating_messages` — Romeo Dating App Messages *(module: RomeoDatingApp)*
- `get_schats` — Sideline Chats and Calls *(module: sChats)*
- `get_WordsWithFriends` — WordsWithFriends *(module: WordsWithFriends)*
- `zangichats` — Zangi Chats *(module: ZangiChats)*

**Chess.com** (4)

- `get_ChessComAccount` — Chess.com Account *(module: ChessComAccount)*
- `get_ChessComGames` — Chess.com Games *(module: ChessComGames)*
- `get_ChessComFriends` — ChessComFriends *(module: ChessComFriends)*
- `get_ChessComMessages` — ChessComMessages *(module: ChessComMessages)*

**Roblox** (9)

- `roblox_account` — Roblox - Account *(module: roblox)*
- `roblox_account_policy` — Roblox - Account Policy *(module: roblox)*
- `roblox_app_launches` — Roblox - App Launches *(module: roblox)*
- `roblox_app_state` — Roblox - Application State *(module: roblox)*
- `roblox_game_activity` — Roblox - Game Activity *(module: roblox)*
- `roblox_marketplace_searches` — Roblox - Marketplace Searches *(module: roblox)*
- `roblox_previous_accounts` — Roblox - Previous Accounts *(module: roblox)*
- `roblox_push_notifications` — Roblox - Push Notifications Received *(module: roblox)*
- `roblox_user_game_settings` — Roblox - User Game Settings *(module: roblox)*

</details>

## Torrents e limpadores

`14_torrents_limpadores` — 18 artefatos. Clientes BitTorrent e apps de limpeza.

<details>
<summary>Categorias (6) e módulos</summary>


**Avast Cleanup** (5)

- `avast_cleanup_app_storage` — Avast Cleanup App Storage and Data Usage *(module: avastCleanup)*
- `avast_cleanup_cleaning_history` — Avast Cleanup Cleaning History *(module: avastCleanup)*
- `avast_cleanup_duplicate_photos` — Avast Cleanup Duplicate Photo Sets *(module: avastCleanup)*
- `avast_cleanup_photo_analysis` — Avast Cleanup Photo Analysis *(module: avastCleanup)*
- `avast_cleanup_video_analysis` — Avast Cleanup Video Analysis *(module: avastCleanup)*

**BitTorrent** (4)

- `get_bittorrentClientpref` — BitTorrent Prefs *(module: bittorrentClientpref)*
- `get_bittorrentDlhist` — bittorrentDlhist *(module: bittorrentDlhist)*
- `get_torrentinfo` — torrentinfo *(module: torrentinfo)*
- `get_torrentResumeinfo` — torrentResumeinfo *(module: torrentResumeinfo)*

**CCleaner** (5)

- `ccleaner_app_storage` — CCleaner App Storage and Data Usage *(module: ccleaner)*
- `ccleaner_cleaning_history` — CCleaner Cleaning History *(module: ccleaner)*
- `ccleaner_duplicate_photos` — CCleaner Duplicate Photo Sets *(module: ccleaner)*
- `ccleaner_photo_analysis` — CCleaner Photo Analysis *(module: ccleaner)*
- `ccleaner_video_analysis` — CCleaner Video Analysis *(module: ccleaner)*

**Libre Torrent** (1)

- `get_libretorrentFR` — LibretorrentFR *(module: libretorrentFR)*

**RAR Lab Prefs** (1)

- `get_rarlabPreferences` — rarlabPreferences *(module: rarlabPreferences)*

**Torrent Data** (2)

- `get_libretorrent` — Torrent Table (libretorrent.db) *(module: libretorrent)*
- `get_TorrentData` — TorrentData *(module: torrentData)*

</details>

## Ordem de execução sugerida

1. `01`–`12` e `15`–`17` — baratos, em qualquer ordem.
2. `02_bugreport_android` — só se o image tiver bugreport.
3. `13_cache_pesado` — por último, sozinho, com expectativa de dezenas de minutos.
4. `14_torrents_limpadores` antes de `13`, se quiser liberar espaço de stash.


## Perfis que não são “baratos”

`13_cache_pesado` é o único que exige uma etapa própria. Os demais leem poucos arquivos por app e
terminam em segundos a poucos minutos.

