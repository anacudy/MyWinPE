$destination = 'WinPE_OC'
$source = 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs'

New-Item -ItemType Directory -Path $destination\0
Copy-Item -Destination $destination\0 -Path $source\*.cab
Remove-Item -Path $destination\0\WinPE-Fonts-Legacy.cab
Remove-Item -Path $destination\0\WinPE-FontSupport-JA-JP.cab
Remove-Item -Path $destination\0\WinPE-FontSupport-KO-KR.cab
Remove-Item -Path $destination\0\WinPE-FontSupport-WinRE.cab
Remove-Item -Path $destination\0\WinPE-FontSupport-ZH-HK.cab
Remove-Item -Path $destination\0\WinPE-FontSupport-ZH-TW.cab
Remove-Item -Path $destination\0\WinPE-PmemCmdlets.cab
Remove-Item -Path $destination\0\WinPE-Setup-ASZ.cab

New-Item -ItemType Directory -Path $destination\1
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-HTA.cab
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-NetFX.cab
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-PowerShell.cab
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-SecureStartup.cab
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-Setup-Client.cab
Move-Item -Destination $destination\1 -Path $destination\0\WinPE-Setup-Server.cab

New-Item -ItemType Directory -Path $destination\2
Move-Item -Destination $destination\2 -Path $destination\0\WinPE-DismCmdlets.cab
Move-Item -Destination $destination\2 -Path $destination\0\WinPE-PlatformID.cab
Move-Item -Destination $destination\2 -Path $destination\0\WinPE-SecureBootCmdlets.cab
Move-Item -Destination $destination\2 -Path $destination\0\WinPE-StorageWMI.cab

Copy-Item -Destination $destination -Path $source\zh-cn -Recurse
Move-Item -Destination $destination\0 -Path $destination\zh-cn\lp.cab
Remove-Item -Path $destination\zh-cn\WinPE-PmemCmdlets_zh-cn.cab
Remove-Item -Path $destination\zh-cn\WinPE-Rejuv_zh-cn.cab
Remove-Item -Path $destination\zh-cn\WinPE-Setup-ASZ_zh-cn.cab
Remove-Item -Path $destination\zh-cn\WinPE-SRT_zh-cn.cab
