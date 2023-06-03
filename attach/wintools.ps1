if (!($env:HOME))
{
  $env:HOME="$env:USERPROFILE"
}

$env:PATH="$env:HOME\bin;$env:HOME\lib;$env:HOME\etc;C:\bin;C:\lib;C:\etc;$env:PATH"

if (!($env:CTDEFAULT_FLAV))
{
  $env:CTDEFAULT_FLAV="default"
}

if (!($env:PENV) )
{
  $env:PENV="WIN32"
}

if (!($env:SHELL_TYPE))
{
  $env:SHELL_TYPE="powershell"
}

if (!($env:SHELL))
{
  $env:SHELL="ps1"
}

if (!($env:WINTOOLS))
{
  $env:WINTOOLS="$env:HOME\player\wintools"
}

if (!(test-path "$env:WINTOOLS\attach"))
{
  write-output "ERROR: `$env:WINTOOLS\attach was not found.  Is the `$env:WINTOOLS environment variable set correctly?"
  exit
}

$env:CTTOOLS_PATH="$env:WINTOOLS\attach"
$env:PATH="$env:CTTOOLS_PATH;$env:PATH"

write-output "args: $args"
$setup_script=. $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctattach.py wintools

if (!($setup_script))
{
  write-output "error: ctattach.py returned NULL string for setup_script filename!"
  write-output "       'wintools\attach\ctattach.py' probably doesn't exist, make sure you've cloned wintools and set the `$env:WINTOOLS environment variable."
}
else
{
  . $setup_script
  . $env:CTTOOLS_PATH\wintools.alias.ps1
  ctshowprojs
}

