@echo off
setlocal EnableExtensions

set "WINPE_DIR=%CD%\WinPE"

call "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"

set "MOUNT_DIR=%WINPE_DIR%\mount"
set "OC_PATH=%WinPERoot%\amd64\WinPE_OCs"
set "LANG_PATH=%OC_PATH%\zh-cn"

echo Creating WinPE...
copype amd64 "%WINPE_DIR%"
if errorlevel 1 exit /b 1

echo Mounting...
dism /Mount-Image /ImageFile:"%WINPE_DIR%\media\sources\boot.wim" /index:1 /MountDir:"%MOUNT_DIR%"
if errorlevel 1 exit /b 1

echo Adding packages...

call :Add "%OC_PATH%\WinPE-WMI.cab"
call :Add "%OC_PATH%\WinPE-Scripting.cab"
call :Add "%OC_PATH%\WinPE-FontSupport-ZH-CN.cab"
call :Add "%LANG_PATH%\lp.cab"
call :Add "%LANG_PATH%\WinPE-WMI_zh-cn.cab"
call :Add "%LANG_PATH%\WinPE-Scripting_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-NetFx.cab"
call :Add "%OC_PATH%\WinPE-SecureStartup.cab"
call :Add "%LANG_PATH%\WinPE-NetFx_zh-cn.cab"
call :Add "%LANG_PATH%\WinPE-SecureStartup_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-PowerShell.cab"
call :Add "%LANG_PATH%\WinPE-PowerShell_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-DismCmdlets.cab"
call :Add "%OC_PATH%\WinPE-SecureBootCmdlets.cab"
call :Add "%OC_PATH%\WinPE-StorageWMI.cab"
call :Add "%OC_PATH%\WinPE-PmemCmdlets.cab"
call :Add "%LANG_PATH%\WinPE-DismCmdlets_zh-cn.cab"
call :Add "%LANG_PATH%\WinPE-StorageWMI_zh-cn.cab"
call :Add "%LANG_PATH%\WinPE-PmemCmdlets_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-HTA.cab"
call :Add "%LANG_PATH%\WinPE-HTA_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-PlatformId.cab"
call :Add "%OC_PATH%\WinPE-Setup.cab"
call :Add "%LANG_PATH%\WinPE-Setup_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-Setup-Client.cab"
call :Add "%LANG_PATH%\WinPE-Setup-Client_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-Setup-Server.cab"
call :Add "%LANG_PATH%\WinPE-Setup-Server_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-Setup-ASZ.cab"
call :Add "%LANG_PATH%\WinPE-Setup-ASZ_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-LegacySetup.cab"
call :Add "%LANG_PATH%\WinPE-LegacySetup_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-Dot3Svc.cab"
call :Add "%LANG_PATH%\WinPE-Dot3Svc_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-EnhancedStorage.cab"
call :Add "%LANG_PATH%\WinPE-EnhancedStorage_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-FMAPI.cab"
call :Add "%OC_PATH%\WinPE-GamingPeripherals.cab"
call :Add "%OC_PATH%\WinPE-HSP-Driver.cab"
call :Add "%OC_PATH%\WinPE-MDAC.cab"
call :Add "%LANG_PATH%\WinPE-MDAC_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-PPPoE.cab"
call :Add "%LANG_PATH%\WinPE-PPPoE_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-RNDIS.cab"
call :Add "%LANG_PATH%\WinPE-RNDIS_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-WDS-Tools.cab"
call :Add "%LANG_PATH%\WinPE-WDS-Tools_zh-cn.cab"
call :Add "%OC_PATH%\WinPE-WinReCfg.cab"
call :Add "%LANG_PATH%\WinPE-WinReCfg_zh-cn.cab"

echo Setting locale...
dism /Image:"%MOUNT_DIR%" /Set-AllIntl:zh-CN
dism /Image:"%MOUNT_DIR%" /Set-TimeZone:"China Standard Time"
dism /Image:"%MOUNT_DIR%" /Set-InputLocale:0804:00000804
dism /Image:"%MOUNT_DIR%" /Set-UserLocale:zh-CN
dism /Image:"%MOUNT_DIR%" /Set-SysLocale:zh-CN

echo Committing...
dism /Unmount-Image /MountDir:"%MOUNT_DIR%" /commit
if errorlevel 1 exit /b 1

echo Creating ISO...
MakeWinPEMedia /ISO "%WINPE_DIR%" "%WinPE%.iso" /bootex
if errorlevel 1 exit /b 1

echo Done
goto :eof

:Add
if exist "%~1" (
    echo Adding %~nx1
    dism /Image:"%MOUNT_DIR%" /Add-Package /PackagePath:"%~1"
    if errorlevel 1 (
        echo Failed: %~nx1
        exit /b 1
    )
) else (
    echo Skip: %~nx1
)
exit /b 0
