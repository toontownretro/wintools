#
# env.ps1
# -----------------------------------------------------------------------------
# This file should be imported by your .bashrc when you launch the terminal.
# It sets up necessary environment variables and executes the WINTOOLS setup
# script, which sets up further necessary things.
#
# You can add any other environment variables and commands you would like to be
# executed when you launch the terminal.
# -----------------------------------------------------------------------------


# Specify where our local Config.pp file is located.
$env:PPREMAKE_CONFIG="$HOME\Config.pp"

# Correct this to the location of your Python install.
$env:PYTHON_LOCATION="$HOME\AppData\Local\Programs\Python\Python311"

# Correct this to the location of your Maya install.
$env:MAYA_LOCATION="C:\Program Files\Autodesk\Maya2020"

$env:WINTOOLS="$HOME\player\wintools"

# Invoke the WINTOOLS startup script.  This further bootstraps our
# environment and attaches us to WINTOOLS.
. $env:WINTOOLS\attach\wintools.ps1

# Make Visual Studio tools available on our path.  Correct the VS version
# and platform architecture as needed.
attach-vs 2022 x64

# You can add other automatic attachments here.  Note that if you attach to
# a tree low in the hierarchy, all the the parent trees will automatically be
# attached to as well.  For instance, cta toontown will also attach you to
# ttmodels, otp, dmodels, direct, and panda, which pretty much covers
# everything.
