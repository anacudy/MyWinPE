$PATH = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64"

Rename-Item -Path "$PATH\Media" -NewName "Media_Backup"
New-Item -ItemType Directory -Path "$PATH\Media"
@(
  "Boot",
  "EFI",
  "zh-cn",
  "bootmgr",
  "bootmgr.efi"
).ForEach({
    Copy-Item -Recurse -Destination "$PATH\Media" -Path "$PATH\Media_Backup\$PSItem"
  })

New-Item -ItemType Directory -Path "WinPE_OC\0"
@(
  "WinPE-Dot3Svc.cab",
  "WinPE-EnhancedStorage.cab",
  "WinPE-FMAPI.cab",
  "WinPE-FontSupport-ZH-CN.cab",
  "WinPE-HSP-Driver.cab",
  "WinPE-MDAC.cab",
  "WinPE-PPPoE.cab",
  "WinPE-RNDIS.cab",
  "WinPE-Scripting.cab",
  "WinPE-WDS-Tools.cab",
  "WinPE-WinReCfg.cab",
  "WinPE-WMI.cab"
).ForEach({
    Copy-Item -Destination "WinPE_OC\0" -Path "$PATH\WinPE_OCs\$PSItem"
  })
Copy-Item -Destination "WinPE_OC\0" -Path "$PATH\WinPE_OCs\zh-cn\lp.cab"

New-Item -ItemType Directory -Path "WinPE_OC\1"
@(
  "WinPE-HTA.cab",
  "WinPE-NetFx.cab",
  "WinPE-PowerShell.cab",
  "WinPE-SecureStartup.cab"
).ForEach({
    Copy-Item -Destination "WinPE_OC\1" -Path "$PATH\WinPE_OCs\$PSItem"
  })

New-Item -ItemType Directory -Path "WinPE_OC\2"
@(
  "WinPE-DismCmdlets.cab",
  "WinPE-PlatformId.cab",
  "WinPE-SecureBootCmdlets.cab",
  "WinPE-StorageWMI.cab"
).ForEach({
    Copy-Item -Destination "WinPE_OC\2" -Path "$PATH\WinPE_OCs\$PSItem"
  })

New-Item -ItemType Directory -Path "WinPE_OC\zh-cn"
@(
  "WinPE-DismCmdlets_zh-cn.cab",
  "WinPE-Dot3Svc_zh-cn.cab",
  "WinPE-EnhancedStorage_zh-cn.cab",
  "WinPE-HTA_zh-cn.cab",
  "WinPE-MDAC_zh-cn.cab",
  "WinPE-NetFx_zh-cn.cab",
  "WinPE-PowerShell_zh-cn.cab",
  "WinPE-PPPoE_zh-cn.cab",
  "WinPE-RNDIS_zh-cn.cab",
  "WinPE-Scripting_zh-cn.cab",
  "WinPE-SecureStartup_zh-cn.cab",
  "WinPE-StorageWMI_zh-cn.cab",
  "WinPE-WDS-Tools_zh-cn.cab",
  "WinPE-WinReCfg_zh-cn.cab",
  "WinPE-WMI_zh-cn.cab"
).ForEach({
    Copy-Item -Destination "WinPE_OC\zh-cn" -Path "$PATH\WinPE_OCs\zh-cn\$PSItem"
  })
