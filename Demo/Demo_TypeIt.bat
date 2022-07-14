@Echo off
cls
SetLocal EnableDelayedExpansion
Title Demo TypeIt Test - www.batch-man.com

Pushd "..\Src"
Color 0a
Call TypeIt.bat "This is a test"&Echo.
pause
cls
TypeIt.bat /?
Popd