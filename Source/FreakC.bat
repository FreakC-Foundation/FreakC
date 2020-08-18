@echo off
setlocal enabledelayedexpansion
if "%1" == "" fcshell
if "%2" == "--compile" set fccompile=true
set a=%1
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	for %%a in (%%x) do (
		set printString=%%x
		if %%a == Swear[fnc] echo echo !printString:~11!>>%a%.bat
		if %%a == SwearLine[fnc] echo echo. !printString:~15!>>%a%.bat
		if %%a == PukeDir[fnc] echo md !printString:~13!>>%a%.bat
		if %%a == EatDir[fnc] echo cd !printString:~12!>>%a%.bat
		if %%a == Trash[fnc] echo del !printString:~11!>>%a%.bat
		if %%a == TrashDir[fnc] echo rmdir !printString:~14!>>%a%.bat
		if %%a == StealDiary[fnc] echo type !printString:~16!>>%a%.bat
		if %%a == ReadDiary[fnc] echo call !printString:~15!>>%a%.bat
		if %%a == HackerMan[fnc] echo !printString:~15!>>%a%.bat
		if %%a == WaitForBus[fnc] echo timeout /t !printString:~16! /nobreak>>%a%.bat
		if %%a == OddOrEven[fnc] (
			set /a num=!printString:~15! %% 2>>%a%.bat
			if !num! == 0 set result=Is even>>%a%.bat
			if not !num! == 0 set result=Is odd>>%a%.bat
			echo echo !result!>>%a%.bat
		)
		if %%a == PoopInt[fnc] echo set /a !printString:~13!>>%a%.bat
		if %%a == PoopString[fnc] echo set !printString:~16!>>%a%.bat
		if %%a == PoopInput[fnc] echo set /p !printString:~15!>>%a%.bat
		if %%a == PoopFnc[fnc] echo :!printString:~13!>>%a%.bat
		if %%a == EatFnc[fnc] echo goto !printString:~12!>>%a%.bat
		if %%a == GrabFnc[fnc] echo call !printString:~13!>>%a%.bat
		if %%a == ChangeColor[fnc] echo color !printString:~17!>>%a%.bat
		if %%a == ChangeName[fnc] echo title !printString:~16!>>%a%.bat
		if %%a == ChangeSize[fnc] echo mode !printString:~16!>>%a%.bat
		if %%a == RenameFile[fnc] echo ren !printString:~16!>>%a%.bat
	)
	if %%x == Die[fnc] echo exit>>%a%.bat
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
	if %%x == OpenHouse[fnc] echo SETLOCAL>>%a%.bat
	if %%x == CloseHouse[fnc] echo ENDLOCAL>>%a%.bat
)
echo pause>>%a%.bat
if not "%fccompile%" == "true" call %a%.bat
@echo on