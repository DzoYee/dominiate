@echo off
setlocal enabledelayedexpansion enableextensions
cd ..
set LIST=
for /f "delims=" %%x in ('forfiles /m *.coffee /c "cmd /c echo @relpath"') do (
set LIST=!LIST! %%x
)

set LIST=%LIST:~1%

docco %LIST%