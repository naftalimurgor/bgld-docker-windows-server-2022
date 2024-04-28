@echo off
setlocal

REM Enable echoing commands
set "echo=echo on"

REM Generate BGL.conf
call :bgl_init

REM Execute BGLd with additional arguments
call BGLd %*

exit /b

:bgl_init
REM Implement the logic to generate BGL.conf here
REM You can use the same logic as in the previous example to generate BGL.conf
exit /b
