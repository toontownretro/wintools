@echo off

if "%HOME%" == "" (
  set HOME=%USERPROFILE%
)

set PATH=%HOME%\bin;%HOME%\lib;%HOME%\etc;C:\bin;C:\lib;C:\etc;%PATH%

if "%CTDEFAULT_FLAV%" == "" (
  set CTDEFAULT_FLAV=default
)

if "%PENV%" == "" (
  set PENV=WIN32
)

if "%SHELL_TYPE%" == "" (
  set SHELL_TYPE=bat
)

if "%WINTOOLS%" == "" (
  set WINTOOLS=%HOME%\player\wintools
)

if not exist "%WINTOOLS%\attach" (
  echo ERROR: %%WINTOOLS%%\attach was not found!  Is the %%WINTOOLS%% environment variable set correctly?
  exit
)

set cttools_path=%WINTOOLS%\attach
set PATH=%cttools_path%;%PATH%

set SETUP_SCRIPT=

if "%1" == "" (
  for /F "tokens=* delims=\n" %%a in ('%PYTHON_LOCATION%\python.exe %cttools_path%\ctattach.py wintools') do echo %%a && set SETUP_SCRIPT=%%a
) else (
  for /F "tokens=* delims=\n" %%a in ('%PYTHON_LOCATION%\python.exe %cttools_path%\ctattach.py wintools %1') do echo %%a && set SETUP_SCRIPT=%%a
)

if "%SETUP_SCRIPT%" == "" (
  echo error: ctattach.py returned NULL string for setup_script filename!
  echo        'wintools\attach\ctattach.py' probably doesn't exist, make sure you've cloned wintools and set the %%WINTOOLS%% environment variable.
)

call %SETUP_SCRIPT%
REM Show our attachments.
call ctshowprojs
