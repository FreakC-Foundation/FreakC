@echo off
title FreakC Compiler
:menu
cls
echo Copyrighted (C) 2020 Nguyen Phu Minh
echo.
echo FreakC Compiler
echo.
echo.
set /p a=File to run:
if not "%a%" == "" goto compile
goto menu
:compile
cls
set /a unc=0
set /a cmake=1
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
:compile2
for /f %%x in ('find /n "HelloWorld[str]" %a%.fclang') do (
	if %%x == [%cmake%]HelloWorld[str] (
		echo echo Hello, World!>>%a%.bat
	) 
)
for /f %%x in ('find /n "RandomNumMinimum[int]" %a%.fclang') do (
	if %%x == [%cmake%]RandomNumMinimum[int] (
		:set1
		set /a rnd=%random% %% 99 + 0
		if "%rnd%" == "" goto set1
		echo echo %rnd%>>%a%.bat
	)
)
for /f %%x in ('find /n "RandomNumShort[int]" %a%.fclang') do (
	if %%x == [%cmake%]RandomNumShort[int] (
		:set2
		set /a rnd1=%random% %% 999 + 0
		if "%rnd1%" == "" goto set2
		echo echo %rnd1%>>%a%.bat
	)
)
for /f %%x in ('find /n "RandomNum[int]" %a%.fclang') do (
	if %%x == [%cmake%]RandomNum[int] (
		echo echo %random%>>%a%.bat
	)
)
for /f %%x in ('find /n "GrabMeADrink[str]" %a%.fclang') do (
	if %%x == [%cmake%]GrabMeADrink[str] (
		echo echo Grab me a drink!>>%a%.bat
	)
)
for /f %%x in ('find /n "Loop[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]Loop[fnc] (
		echo goto FreakCCompiled>>%a%.bat
	)
)
for /f %%x in ('find /n "Sleep[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]Sleep[fnc] (
		:set3
		set /a rnd2=%random% %% 9 + 0
		if "%rnd2%" == "" goto set3
		echo timeout %rnd2% /nobreak>>%a%.bat
	)
)
for /f %%x in ('find /n "EnterMatrix[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]EnterMatrix[fnc] (
		echo :matrix>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo goto matrix>>%a%.bat
	)
)
for /f %%x in ('find /n "EnterMatrixHacker[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]EnterMatrixHacker[fnc] (
		echo color 0a>>%a%.bat
		echo :matrix>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>%a%.bat
		echo goto matrix>>%a%.bat
	)
)
for /f %%x in ('find /n "ShutdownSystem[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]ShutdownSystem[fnc] (
		echo shutdown -s>>%a%.bat
	)
)
for /f %%x in ('find /n "RestartSystem[fnc]" %a%.fclang') do (
	if %%x == [%cmake%]RestartSystem[fnc] (
		echo shutdown -r>>%a%.bat
	)
)
:runtest
if %unc% GEQ 20 goto done
set /a unc=%unc%+1
set /a cmake=%cmake%+1
goto compile2
:done
echo pause>nul >>%a%.bat
if "%option%" == "interpreter" goto run
set a=
goto menu
:run
call %a%.bat
set a=
goto menu