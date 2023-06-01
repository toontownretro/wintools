@echo off

REM env.bat
REM ===========================================================================
REM This file is automatically executed when you launch the console using the
REM Terminal shortcut.  It sets up necessary environment variables and executes
REM the WINTOOLS setup script, which sets up futher necessary things.
REM
REM You can add any other environment variables and commands you would like to
REM be executed when the Terminal launches.
REM ===========================================================================

REM Specify where our local Config.pp file is located.
set PPREMAKE_CONFIG=%USERPROFILE%\Config.pp

REM Correct this to the location of your Python install.
set PYTHON_LOCATION=C:\Python39

REM Correct this to the location of your Maya install.
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2020

REM This script provided by Visual Studio sets up appropriate environment
REM variables so we can invoke the Visual C++ compiler.  You may need to
REM correct this path.
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set WINTOOLS=%USERPROFILE%\player\wintools

REM Invoke the WINTOOLS startup script.  This further bootstraps our
REM environment and attaches us to WINTOOLS.
call %WINTOOLS%\attach\wintools.bat

REM You can add other automatic attachments here.  Note that if you attach to
REM a tree low in the hierarchy, all the the parent trees will automatically be
REM attached to as well.  For instance, cta toontown will also attach you to
REM ttmodels, otp, dmodels, direct, and panda, which pretty much covers
REM everything.
