
function ctshowprojs
{
  . $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctshowprojs.py
}

function cta
{
  . (. $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\ctattach.py $args)
  ctshowprojs
}

function newheader
{
  . $env:PYTHON_LOCATION\python.exe $env:CTTOOLS_PATH\newheader.py $args
}
