@echo off

REM Runs ctattach, then executes and removes the outputted script to set up the
REM environment.

for /F "tokens=* delims=\n" %%a in ('%PYTHON_LOCATION%\python.exe %cttools_path%\ctattach.py %*') do echo %%a && set script=%%a

call "%script%"
del /f "%script%"

call ctshowprojs
