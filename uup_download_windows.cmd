@echo off
:: Generated on 2025-01-31 06:50:35 GMT

:: Proxy configuration
:: If you need to configure a proxy to be able to connect to the internet,
:: then you can do this by configuring the all_proxy environment variable.
:: By default this variable is commented out, configuring aria2c to use 
:: the proxy settings specified by the system.
::
:: Usage: set "all_proxy=proxy_address"
:: For example: set "all_proxy=127.0.0.1:8888"
::
:: More information how to use this can be found at:
:: https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-all-proxy
:: https://aria2.github.io/manual/en/html/aria2c.html#environment

:: Uncomment the following line to override the proxy settings specified
:: by the system.
::
:: set "all_proxy="

:: End of proxy configuration

cd /d "%~dp0"
if NOT "%cd%"=="%cd: =%" (
    echo Current directory contains spaces in its path.
    echo Please move or rename the directory to one not containing spaces.
    echo.
    pause
    goto :EOF
)

if "[%1]" == "[49127c4b-02dc-482e-ac4f-ec4d659b7547]" goto :START_PROCESS
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1 && goto :START_PROCESS

set command="""%~f0""" 49127c4b-02dc-482e-ac4f-ec4d659b7547
SETLOCAL ENABLEDELAYEDEXPANSION
set "command=!command:'=''!"

powershell -NoProfile Start-Process -FilePath '%COMSPEC%' ^
-ArgumentList '/c """!command!"""' -Verb RunAs 2>NUL

IF %ERRORLEVEL% GTR 0 (
    echo =====================================================
    echo This script needs to be executed as an administrator.
    echo =====================================================
    echo.
    pause
)

SETLOCAL DISABLEDELAYEDEXPANSION
goto :EOF

:START_PROCESS
title 26100.3037_amd64_zh-cn_professional_31d8d08b download

set "aria2=files\aria2c.exe"
set "a7z=files\7zr.exe"
set "uupConv=files\uup-converter-wimlib.7z"
set "aria2Script=files\aria2_script.%random%.txt"
set "destDir=UUPs"

powershell -NoProfile -ExecutionPolicy Unrestricted .\files\get_aria2.ps1 || (pause & exit /b 1)
echo.

echo Downloading the UUP converter...
"%aria2%" --no-conf --async-dns=false --console-log-level=warn --log-level=info --log="aria2_download.log" -x16 -s16 -j2 -c -R -d"files" -i"files\converter_windows"
if %ERRORLEVEL% GTR 0 call :DOWNLOAD_CONVERTER_ERROR & exit /b 1
echo.

if NOT EXIST ConvertConfig.ini goto :NO_FILE_ERROR
if NOT EXIST CustomAppsList.txt goto :NO_FILE_ERROR
if NOT EXIST %a7z% goto :NO_FILE_ERROR
if NOT EXIST %uupConv% goto :NO_FILE_ERROR

echo Extracting UUP converter...
"%a7z%" -x!ConvertConfig.ini -x!CustomAppsList.txt -y x "%uupConv%" >NUL
echo.

:DOWNLOAD_APPS
echo Retrieving aria2 script for Microsoft Store Apps...
"%aria2%" --no-conf --async-dns=false --console-log-level=warn --log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=31d8d08b-fac4-47c0-8adb-c42dd7dec639&pack=neutral&edition=app&aria2=2"
echo === 开始 ===
echo ty备注：在 bash shell 环境下使用 sed 命令处理文件 %aria2Script% 以达到如下目的：
echo (1) 删除不必要的 Microsoft Store Apps。
echo (2) 添加最新版本的 Microsoft Store Apps，如 Notepad（记事本）、MSPaint（画图）。
sed -i -e '/Paint/{N;d}; $!N;/\n.*Paint/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Xbox/{N;d}; $!N;/\n.*Xbox/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/News/{N;d}; $!N;/\n.*News/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/StickyNotes/{N;d}; $!N;/\n.*StickyNotes/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Weather/{N;d}; $!N;/\n.*Weather/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/YourPhone/{N;d}; $!N;/\n.*YourPhone/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/YourPhoneStub/{N;d}; $!N;/\n.*YourPhoneStub/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/PowerAutomate/{N;d}; $!N;/\n.*PowerAutomate/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/OfficeHub/{N;d}; $!N;/\n.*OfficeHub/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/OfficeApp/{N;d}; $!N;/\n.*OfficeApp/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Feedback/{N;d}; $!N;/\n.*Feedback/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/GetHelp/{N;d}; $!N;/\n.*GetHelp/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Teams/{N;d}; $!N;/\n.*Teams/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/ToDoStub/{N;d}; $!N;/\n.*ToDoStub/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Todos/{N;d}; $!N;/\n.*Todos/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/MicrosoftCorporationII/{N;d}; $!N;/\n.*MicrosoftCorporationII/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Outlook/{N;d}; $!N;/\n.*Outlook/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Solitaire/{N;d}; $!N;/\n.*Solitaire/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/SoundRecorder/{N;d}; $!N;/\n.*SoundRecorder/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/VoiceRecorder/{N;d}; $!N;/\n.*VoiceRecorder/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/CameraApp/{N;d}; $!N;/\n.*CameraApp/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/WindowsCamera/{N;d}; $!N;/\n.*WindowsCamera/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Zune/{N;d}; $!N;/\n.*Zune/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/QuickAssist/{N;d}; $!N;/\n.*QuickAssist/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Alarms/{N;d}; $!N;/\n.*Alarms/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/BingSearch/{N;d}; $!N;/\n.*BingSearch/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/MicrosoftBing/{N;d}; $!N;/\n.*MicrosoftBing/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Map/{N;d}; $!N;/\n.*Map/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Game/{N;d}; $!N;/\n.*Game/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/MSFamily/{N;d}; $!N;/\n.*MSFamily/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script% && sed -i -e '/Notepad/{N;d}; $!N;/\n.*Notepad/!P;D' %aria2Script% && sed -i '/^$/N;/^\n$/D' %aria2Script%
echo === 结束 ===
if %ERRORLEVEL% GTR 0 call :DOWNLOAD_ERROR & exit /b 1
echo.

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (
    echo Unable to retrieve data from Windows Update servers. Reason: %DETECTED_ERROR%
    echo If this problem persists, most likely the set you are attempting to download was removed from Windows Update servers.
    echo.
    pause
    goto :EOF
)

echo Downloading Microsoft Store Apps...
"%aria2%" --no-conf --async-dns=false --console-log-level=warn --log-level=info --log="aria2_download.log" -x16 -s16 -j25 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 goto :DOWNLOAD_APPS
echo.

:DOWNLOAD_UUPS
echo Retrieving aria2 script for the UUP set...
"%aria2%" --no-conf --async-dns=false --console-log-level=warn --log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=31d8d08b-fac4-47c0-8adb-c42dd7dec639&pack=zh-cn&edition=professional&aria2=2"
if %ERRORLEVEL% GTR 0 call :DOWNLOAD_ERROR & exit /b 1
echo.

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (
    echo Unable to retrieve data from Windows Update servers. Reason: %DETECTED_ERROR%
    echo If this problem persists, most likely the set you are attempting to download was removed from Windows Update servers.
    echo.
    pause
    goto :EOF
)

echo Downloading the UUP set...
"%aria2%" --no-conf --async-dns=false --console-log-level=warn --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 goto :DOWNLOAD_UUPS & exit /b 1

if EXIST convert-UUP.cmd goto :START_CONVERT
pause
goto :EOF

:START_CONVERT
call convert-UUP.cmd
goto :EOF

:NO_FILE_ERROR
echo We couldn't find one of needed files for this script.
pause
goto :EOF

:DOWNLOAD_CONVERTER_ERROR
echo.
echo An error has occurred while downloading the UUP converter.
pause
goto :EOF

:DOWNLOAD_ERROR
echo.
echo We have encountered an error while downloading files.
pause
goto :EOF

:EOF
