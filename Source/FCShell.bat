@echo off
@setlocal enabledelayedexpansion
set command=.
title FreakC Command Prompt
echo.
echo Copyrighted (C) 2020 Nguyen Phu Minh
echo FreakC Command Prompt
echo.
echo.
:c2
set /p command=~
if "%command%" == "HelloWorld[str]" goto HelloWorld
if "%command%" == "RandomNumMinimum[int]" goto RandomNumMinimum
if "%command%" == "RandomNumShort[int]" goto RandomNumShort
if "%command%" == "RandomNum[int]" goto RandomNum
if "%command%" == "GrabMeADrink[str]" goto GrabMeADrink
if "%command%" == "Loop[fnc]" goto Loop
if "%command%" == "Sleep[fnc]" goto Sleep
if "%command%" == "Shutdown[fnc]" goto Shutdown
if "%command%" == "Forget[fnc]" goto Forget
if "%command%" == "GotoToilet[fnc]" goto GotoToilet
if "%command%" == "Restart[fnc]" goto Restart
if "%command%" == "EnterMatrix[fnc]" goto EnterMatrix
if "%command%" == "EnterMatrixHacker[fnc]" goto EnterMatrixHacker
if "%command%" == "ILoveYou[str]" goto ILoveYou
if "%command%" == "Die[fnc]" exit
for %%a in (%command%) do (
	set printString=%command%
	if %%a == Swear[fnc] echo !printString:~11!
	if %%a == PukeDir[fnc] md !printString:~13!
	if %%a == EatDir[fnc] cd !printString:~12!
	if %%a == StealDiary[fnc] type !printString:~16!
	if %%a == HackerMan[fnc] !printString:~15!
	if %%a == OddOrEven[fnc] (
		set /a num=!printString:~15! %% 2
		if !num! == 0 set result=Is even
		if not !num! == 0 set result=Is odd
		echo !result!
	)
	if %%a == PoopInt[fnc] set /a !printString:~13!
	if %%a == PoopString[fnc] set !printString:~16!
	if %%a == PoopInput[fnc] set /p !printString:~15!
	if %%a == Trash[fnc] del !printString:~11!
	if %%a == TrashDir[fnc] rmdir !printString:~14!
	if %%a == ChangeColor[fnc] color !printString:~17!
)
goto c2

:ILoveYou
echo I love you!
goto c2

:Shutdown
shutdown -s -t 0
goto c2

:Restart
shutdown -r -t 0
goto c2

:HelloWorld
echo Hello, World!
goto c2

:RandomNumMinimum
set /a rnd=%random% %% 99 + 0 
echo %rnd%
goto c2

:RandomNumShort
set /a rnd=%random% %% 999 + 0
echo %rnd%
goto c2

:RandomNum
echo %random%
goto c2

:GrabMeADrink
echo Grab me a drink!
goto c2

:Sleep
set /a rnd=%random% %% 9 + 0
timeout %rnd% /nobreak
goto c2

:Loop
echo Sorry but Loop[fnc] doesn't work on FCShell
goto c2

:EnterMatrix
:matrix
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
goto matrix

:EnterMatrixHacker
color 0a
:matrix
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
goto matrix

:Forget
cls
goto c2

:GotoToilet
pause
goto c2