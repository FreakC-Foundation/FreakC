@echo off
if "%1" == "" fcshell
set a=%1
set /a rnd=%random% %% 99 + 0
set /a rnd1=%random% %% 999 + 0
set /a rnd2=%random% %% 9 + 0
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
if %%x == HelloWorld[str] echo echo Hello, World!>>%a%.bat
if %%x == RandomNumMinimum[int] echo echo %rnd%>>%a%.bat
if %%x == RandomNumShort[int] echo echo %rnd1%>>%a%.bat
if %%x == RandomNum[int] echo echo %random%>>%a%.bat
if %%x == GrabMeADrink[str] echo echo Grab me a drink!>>%a%.bat
if %%x == Loop[fnc] echo goto FreakCCompiled>>%a%.bat
if %%x == Sleep[fnc] echo timeout %rnd2% /nobreak>>%a%.bat
if %%x == ShutdownSystem[fnc] echo shutdown -s>>%a%.bat
if %%x == RestartSystem[fnc] echo shutdown -r>>%a%.bat
if %%x == EnterMatrix[fnc] (echo :matrix>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo goto matrix>>%a%.bat)
if %%x == EnterMatrixHacker[fnc] (echo color 0a>>%a%.bat
echo :matrix>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
echo goto matrix>>%a%.bat))
echo pause>>%a%.bat
call %a%.bat
@echo on