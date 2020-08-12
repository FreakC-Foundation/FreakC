@echo off
setlocal enabledelayedexpansion
if "%1" == "" fcshell
set a=%1
set b=0
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	for %%a in (%%x) do (
		set printString=%%x
		if %%a == Swear[fnc] echo echo !printString:~11!>>%a%.bat
		if %%a == PukeDir[fnc] echo md !printString:~13!>>%a%.bat
		if %%a == EatDir[fnc] echo cd !printString:~12!>>%a%.bat
		if %%a == StealDiary[fnc] echo type !printString:~16!>>%a%.bat
		if %%a == HackerMan[fnc] echo !printString:~15!>>%a%.bat
	)
	if %%x == HelloWorld[str] echo echo Hello, World!>>%a%.bat
	if %%x == ILoveYou[str] echo echo I love you!>>%a%.bat
	if %%x == GrabMeADrink[str] echo echo Grab me a drink!>>%a%.bat
	if %%x == RandomNumMinimum[int] (
		set /a rnd=%random% %% 99 + 0
		echo echo !rnd!>>%a%.bat 
	)
	if %%x == RandomNumShort[int] (
		set /a rnd1=%random% %% 999 + 0
		echo echo !rnd1!>>%a%.bat
	)
	if %%x == RandomNum[int] echo echo %random%>>%a%.bat
	if %%x == Sleep[fnc] (
		set /a rnd2=%random% %% 9 + 0
		echo timeout !rnd2! /nobreak>>%a%.bat
	)
	if %%x == Loop[fnc] echo goto FreakCCompiled>>%a%.bat
	if %%x == ShutdownSystem[fnc] echo shutdown -s -t 0>>%a%.bat
	if %%x == RestartSystem[fnc] echo shutdown -r -t 0>>%a%.bat
	if %%x == Forget[fnc] echo cls>>%a%.bat
	if %%x == GotoToilet[fnc] echo pause>>%a%.bat
	if %%x == EnterMatrix[fnc] (
		echo :matrix>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo goto matrix>>%a%.bat
	)
	if %%x == EnterMatrixHacker[fnc] (
		echo color 0a>>%a%.bat
		echo :matrix>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo goto matrix>>%a%.bat
	)
)
echo pause>>%a%.bat
call %a%.bat
@echo on