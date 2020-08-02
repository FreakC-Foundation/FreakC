@echo off
set a=%1
:compile
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	if %%x == HelloWorld[str] (
		echo echo Hello, World!>>%a%.bat
	) 
	if %%x == RandomNumMinimum[int] (
		:set1
		set /a rnd=%random% %% 99 + 0
		if "%rnd%" == "" goto set1
		echo echo %rnd%>>%a%.bat
	)
	if %%x == RestartSystem[fnc] (
		echo shutdown -r>>%a%.bat
	)
	if %%x == RandomNumShort[int] (
		:set2
		set /a rnd1=%random% %% 999 + 0
		if "%rnd1%" == "" goto set2
		echo echo %rnd1%>>%a%.bat
	)
	if %%x == RandomNum[int] (
		echo echo %random%>>%a%.bat
	)
	if %%x == GrabMeADrink[str] (
		echo echo Grab me a drink!>>%a%.bat
	)
	if %%x == Loop[fnc] (
		echo goto FreakCCompiled>>%a%.bat
	)
	if %%x == Sleep[fnc] (
		:set3
		set /a rnd2=%random% %% 9 + 0
		if "%rnd2%" == "" goto set3
		echo timeout %rnd2% /nobreak>>%a%.bat
	)
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
	if %%x == ShutdownSystem[fnc] (
		echo shutdown -s>>%a%.bat
	)
	if %%x == RestartSystem[fnc] (
		echo shutdown -r>>%a%.bat
	)
)
echo pause>>%a%.bat
@echo on