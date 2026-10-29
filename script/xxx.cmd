set "WINPE_PATH=%CD%\WinPE"
set "MOUNT_PATH=%WINPE_PATH%\mount"
set "WINPE_WIM=%WINPE_PATH%\media\sources\boot.wim"
set "PACKAGE_PATH=%CD%\WinPE_OC"

call "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\DandISetEnv.bat" || exit /b

call copype amd64 "%WINPE_PATH%" || exit /b

DISM /Get-ImageInfo /ImageFile:"%WINPE_WIM%" || exit /b

DISM /Mount-Image /Optimize /CheckIntegrity /ImageFile:"%WINPE_WIM%" /MountDir:"%MOUNT_PATH%" /Index:1 || exit /b

DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\0" || exit /b

DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\1" || exit /b

DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\2" || exit /b

DISM /Add-Package /Image:"%MOUNT_PATH%" /PackagePath:"%PACKAGE_PATH%\zh-cn" || exit /b

@REM echo Setting locale...
@REM dism /Image:"%MOUNT_PATH%" /Set-AllIntl:zh-CN
@REM dism /Image:"%MOUNT_PATH%" /Set-TimeZone:"China Standard Time"
@REM dism /Image:"%MOUNT_PATH%" /Set-InputLocale:0804:00000804
@REM dism /Image:"%MOUNT_PATH%" /Set-UserLocale:zh-CN
@REM dism /Image:"%MOUNT_PATH%" /Set-SysLocale:zh-CN

DISM /Unmount-Image /Commit /CheckIntegrity /MountDir:"%MOUNT_PATH%" || exit /b

call MakeWinPEMedia /ISO "%WINPE_PATH%" "%WINPE_PATH%.iso" /bootex || exit /b
