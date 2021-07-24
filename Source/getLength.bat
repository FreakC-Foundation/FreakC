setlocal enabledelayedexpansion
set len=0
set str=%~2
:loop
if not "!str:~%len%!" == "" set /a len+=1 & goto loop
(endlocal & set %~1=%len%)
