@echo off
setlocal

REM Terminate script on error
set "error="

REM Check if the first argument is `-f` or `--some-option` or ends with `.conf`
echo %1 | findstr /r "^-.*$ *.conf$" > nul
if %errorlevel% equ 0 (
    call :bgl_oneshot %*
)

REM Allow the container to be started with `--user`, if running as root drop privileges
if "%1"=="bgl_oneshot" if "%USERPROFILE%"=="" (
    REM Assuming gosu is available in the path
    REM Replace "BGL" with the appropriate username if needed
    REM Adjust the directory accordingly if needed
    REM Replace "bgl_oneshot.bat" with the appropriate filename if needed
    chown /R BGL .
    gosu BGL bgl_oneshot.bat %*
    goto :end
)

REM If not root (i.e. docker run --user $USER ...), then run as invoked
%*
goto :end

:bgl_oneshot
REM This section is not needed since bgl_oneshot is an external .bat file
goto :eof

:end
REM Clean up resources and exit
exit /b
