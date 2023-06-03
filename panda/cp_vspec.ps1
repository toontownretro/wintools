$vspec_dir="$HOME\etc"
if (!(test-path "$vspec_dir"))
{
  new-item -Path "$vspec_dir" -ItemType "directory"
}
copy-item -Path "*.vspec" -Destination "$vspec_dir"
