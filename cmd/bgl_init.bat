@echo off
setlocal

REM Enable echoing commands
set "echo=echo on"

REM Check if BGL.conf exists in the user's home directory
if not exist "%USERPROFILE%\.BGL\BGL.conf" (
    mkdir "%USERPROFILE%\.BGL"
    
    echo Creating BGL.conf

    REM Seed a random password for JSON RPC server
    set "RPCBIND=%RPCBIND:-0.0.0.0%"
    set "RPCPORT=%RPCPORT:-8455%"
    set "RPCALLOWIP=%RPCALLOWIP:-0.0.0.0/0%"
    set "REGTEST=%REGTEST:-0%"
    set "PRINTTOCONSOLE=%PRINTTOCONSOLE:-1%"
    set "RPCUSER=%RPCUSER:-localuser%"
    set "RPCPASSWORD="
    for /f %%a in ('"dd if=/dev/urandom bs=33 count=1 2>nul | base64"') do set "RPCPASSWORD=%%a"

    (
        echo rpcbind=%RPCBIND%
        echo rpcport=%RPCPORT%
        echo rpcallowip=%RPCALLOWIP%
        echo regtest=%REGTEST%
        echo printtoconsole=%PRINTTOCONSOLE%
        echo rpcuser=%RPCUSER%
        echo rpcpassword=%RPCPASSWORD%
    ) > "%USERPROFILE%\.BGL\BGL.conf"
)

REM Display the contents of BGL.conf
type "%USERPROFILE%\.BGL\BGL.conf"

echo Initialization completed successfully
