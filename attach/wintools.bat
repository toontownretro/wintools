@echo off

if "%HOME%" == "" (
  set HOME=%USERPROFILE%
)

if "%PLAYER%" == "" (
  set PLAYER=%USERPROFILE%\player
)

if "%PPREMAKE_CONFIG%" == "" (
  set PPREMAKE_CONFIG=%PLAYER%\Config.pp
)

if "%CTDEFAULT_FLAV%" == "" (
  set CTDEFAULT_FLAV=default
)

if "%CTVSPEC_PATH%" == "" (
  set CTVSPEC_PATH=%PLAYER%\vspec
)

if "%PENV%" == "" (
  set PENV=WIN32
)

if "%SHELL_TYPE%" == "" (
  set SHELL_TYPE=bat
)

if "%WINTOOLS%" == "" (
  set WINTOOLS=%PLAYER%\wintools
)

if not exist "%WINTOOLS%\attach" (
  echo ERROR: %%WINTOOLS%%\attach was not found!  Is the %%WINTOOLS%% environment variable set correctly?
  exit
)

set cttools_path=%WINTOOLS%\attach
set PATH=%cttools_path%;%PATH%

set SETUP_SCRIPT=

if "%1" == "" (
  for /F "tokens=* delims=\n" %%a in ('%cttools_path%\ctattach.py wintools') do echo %%a && set SETUP_SCRIPT=%%a
) else (
  for /F "tokens=* delims=\n" %%a in ('%cttools_path%\ctattach.py wintools %1') do echo %%a && set SETUP_SCRIPT=%%a
)

if "%SETUP_SCRIPT%" == "" (
  echo error: ctattach.py returned NULL string for setup_script filename!
  echo        'wintools\attach\ctattach.py' probably doesn't exist, make sure you've cloned wintools and set the %%WINTOOLS%% environment variable.
)

call %SETUP_SCRIPT%
REM Show our attachments.
call ctshowprojs
