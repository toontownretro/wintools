# This script copies necessary files from wintools into your player directory
# to get you started.

write-output "------------ WINTOOLS SETUP ------------"

.\cp_vspec

foreach ($file in ("env.ps1", "Config.pp", "Config.prc"))
{
  copy-item "$file" -Destination "$HOME"
}

write-output "Setup is finished."
