@echo off

REM This script copies necessary files from wintools into your player directory
REM to get you started.

echo ------------ WINTOOLS SETUP ------------

call cp_vspec

for %%x in (env.bat Config.pp Config.prc Terminal.lnk) do (
    copy /Y %%x %USERPROFILE%\
)

echo Setup is finished.
