@echo off

echo ------------ WINTOOLS SETUP ------------

set /p PlayerDir=Enter your player directory [%USERPROFILE%\player]:
if (%PlayerDir% == "") do (
    set PlayerDir=%USERPROFILE%\player
)

echo Player dir is: %PlayerDir%

set Projects=ppremake wintools dtool panda pandatool direct dmodels otp toontown ttmodels

if not exist "%PlayerDir%\vspec" (
    mkdir %PlayerDir%\vspec
)

for %%x in (%Projects%) do (
    copy %%x.vspec %PlayerDir%\vspec\%%x.vspec
)

copy Config.pp.sample %PlayerDir%\Config.pp

set EnvFile=%PlayerDir%\env.bat

copy Terminal.lnk %PlayerDir%\Terminal.lnk

echo @echo off> %EnvFile%
echo set PLAYER=%PlayerDir%>> %EnvFile%
echo set DTOOL=%%PLAYER%%\dtool>> %EnvFile%
echo set PPREMAKE_CONFIG=%%PLAYER%%\Config.pp>> %EnvFile%
echo set PYTHONPATH=%%DTOOL%%\src\attach;%%PYTHONPATH%%>> %EnvFile%
echo set PATH=%%DTOOL%%\src\attach;%%PATH%%>> %EnvFile%
echo set CTVSPEC_PATH=%%PLAYER%%\vspec>> %EnvFile%
echo @call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat">> %EnvFile%

pause
