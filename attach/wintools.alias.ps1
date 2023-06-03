
function ctshowprojs
{
  . $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctshowprojs.py
}

function ctattach
{
  . (. $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctattach.py $args)
  ctshowprojs
}
new-alias -Name "cta" -Value "ctattach"

function ctunattach
{
  . (. $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctunattach.py $args)
  ctshowprojs
}
new-alias -Name "ctuna" -Value "ctunattach"

function cta-ship
{
  $CTSAVE="$env:CTDEFAULT_FLAV"
  $env:CTDEFAULT_FLAV="ship"
  cta $args
  $env:CTDEFAULT_FLAV="$CTSAVE"
}

function cta-release
{
  $CTSAVE="$env:CTDEFAULT_FLAV"
  $env:CTDEFAULT_FLAV="release"
  cta $args
  $env:CTDEFAULT_FLAV="$CTSAVE"
}

function cta-install
{
  $CTSAVE="$env:CTDEFAULT_FLAV"
  $env:CTDEFAULT_FLAV="install"
  cta $args
  $env:CTDEFAULT_FLAV="$CTSAVE"
}

function newheader
{
  . $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\newheader.py $args
}

function attach-vs
{
  if (!(get-command Get-VSSetupInstance))
  {
    write-output "Please install the VSSetup Powershell module."
    return
  }

  $year=$args[0]
  if (!($year))
  {
    $year="2022"
  }
  $plat=$args[1]
  if (!($plat))
  {
    if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64")
    {
      $plat="x64"
    }
    elseif ($env:PROCESSOR_ARCHITECTURE -eq "x86")
    {
      $plat="x86"
    }
    else
    {
      write-output "Couldn't determine platform architecture."
      return
    }
  }
  $allVS=(Get-VSSetupInstance -All)
  foreach ($vsInfo in $allVS)
  {
    if ("$($vsinfo.DisplayName)" | Select-String -Pattern "$year" -SimpleMatch)
    {
      $selectedVS=$vsInfo
      break
    }
  }
  if (!($selectedVS))
  {
    write-output "Couldn't find Visual Studio $year."
    return
  }
  write-output "Found Visual Studio $year at $($selectedVS.InstallationPath), platform $plat."
  import-Module "$($selectedVS.InstallationPath)\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
  Enter-VsDevShell $selectedVS.InstanceId -SkipAutomaticLocation -DevCmdArguments "-arch=$plat -host_arch=$plat"
}
