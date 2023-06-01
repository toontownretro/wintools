@echo off

set vspec_dir=%USERPROFILE%\etc

if not exist %vspec_dir% mkdir %vspec_dir%
xcopy /I/Y *.vspec %vspec_dir%\
