set "WINPE_PATH=%CD%\WinPE"
set "MOUNT_PATH=%WINPE_PATH%\mount"
set "WINPE_WIM=%WINPE_PATH%\media\sources\boot.wim"
set "PACKAGE_PATH=%CD%\WinPE_OC"

call "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat"

call copype amd64 "%WINPE_PATH%"

DISM /Get-ImageInfo /ImageFile:"%WINPE_WIM%"

DISM /Mount-Image /Optimize /CheckIntegrity /ImageFile:"%WINPE_WIM%" /MountDir:"%MOUNT_PATH%" /Index:1

DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\0"
DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\1"
DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\2"
DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\zh-cn"

@REM echo Setting locale...
@REM dism /Image:"%MOUNT_PATH%" /Set-AllIntl:zh-CN
@REM dism /Image:"%MOUNT_PATH%" /Set-TimeZone:"China Standard Time"
@REM dism /Image:"%MOUNT_PATH%" /Set-InputLocale:0804:00000804
@REM dism /Image:"%MOUNT_PATH%" /Set-UserLocale:zh-CN
@REM dism /Image:"%MOUNT_PATH%" /Set-SysLocale:zh-CN

DISM /Unmount-Image /Commit /CheckIntegrity /MountDir:"%MOUNT_PATH%"

call MakeWinPEMedia /ISO "%WINPE_PATH%" "%WINPE_PATH%.iso" /bootex
