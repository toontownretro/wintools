@echo off

REM This script copies necessary files from wintools into your player directory
REM to get you started.

echo ------------ WINTOOLS SETUP ------------

set PlayerDir=%USERPROFILE%\player

if not exist %PlayerDir%\vspec mkdir %PlayerDir%\vspec
xcopy /I/Y *.vspec %PlayerDir%\vspec\

for %%x in (env.bat Config.pp Config.prc Terminal.lnk) do (
    copy /Y %%x %PlayerDir%\
)

echo Setup is finished.
