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
if "%command%" == "Shutdown[fnc]" goto Shutdown
if "%command%" == "Forget[fnc]" goto Forget
if "%command%" == "GotoToilet[fnc]" goto GotoToilet
if "%command%" == "Restart[fnc]" goto Restart
if "%command%" == "Die[fnc]" exit
if "%command%" == "MyMemory[fnc]" dir
if "%command%" == "SeeTime[fnc]" time /t
if "%command%" == "SeeDate[fnc]" date /t
if "%command%" == "BuyClock[fnc]" time
if "%command%" == "BuyCalender[fnc]" date
for %%a in (%command%) do (
	set printString=%command%
	if %%a == Swear[fnc] echo !printString:~11!
	if %%a == SwearLine[fnc] echo. !printString:~15!
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
	if %%a == ChangeName[fnc] title !printString:~16!
	if %%a == ChangeSize[fnc] mode !printString:~16!
	if %%a == RenameFile[fnc] ren !printString:~16!
	if %%a == WaitForBus[fnc] timeout /t !printString:~16! /nobreak
	if %%a == ReadDiary[fnc] call !printString:~15!
	if %%a == MoveFile[fnc] echo !printString:~14!
	if %%a == CopyFile[fnc] echo !printString:~14!
	if %%a == EatDrive[fnc] !printString:~14!:
	if %%a == PlayFile[fnc] start !printString:~14!
)
goto c2

:Shutdown
shutdown -s -t 0
goto c2

:Restart
shutdown -r -t 0
goto c2

:Forget
cls
goto c2

:GotoToilet
pause
goto c2