@echo off

REM env.bat
REM ===========================================================================
REM This file is automatically executed when you launch the console using the
REM Terminal shortcut.  It sets up necessary environment variables and executes
REM the DTOOL setup script, which sets up futher necessary things.
REM
REM You can add any other environment variables and commands you would like to
REM be executed when the Terminal launches.
REM ===========================================================================

REM Correct this to the location of your Python install.
set PYTHON_LOCATION=C:\Python39

REM Correct this to the location of your Maya install.
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2020

REM This script provided by Visual Studio sets up appropriate environment
REM variables so we can invoke the Visual C++ compiler.  You may need to
REM correct this path.
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

REM Correct this if your player directory is located anywhere other than
REM C:\Users\[username]\player.
set PLAYER=%USERPROFILE%\player

set DTOOL=%PLAYER%\dtool

REM ===============================================================
REM You probably don't want to mess with this right here.

if exist "%DTOOL%\built\etc" (
  REM If this is a built dtool, invoke the installed startup script.
  call %DTOOL%\built\etc\dtool.bat
) else (
  REM If this is not a built dtool, invoke the startup script directly from
  REM source.
  call %DTOOL%\src\attach\dtool.bat
)
REM ===============================================================

REM We attached to dtool above, now attach to ppremake and wintools.
call cta ppremake
call cta wintools

REM You can add other automatic attachments here.  Note that if you attach to
REM a tree low in the hierarchy, all the the parent trees will automatically be
REM attached to as well.  For instance, cta toontown will also attach you to
REM ttmodels, otp, dmodels, direct, and panda, which pretty much covers
REM everything.
