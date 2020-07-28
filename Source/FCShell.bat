@echo off
color 6f
set command=.
title FreakC Command Prompt
:c1
echo.
echo Copyrighted (C) 2020 Nguyen Phu Minh
echo FreakC Command Prompt
echo.
echo.
set /p command=~
if "%command%" == "HelloWorld[str]" goto HelloWorld
if "%command%" == "RandomNumMinimum[int]" goto RandomNumMinimum
if "%command%" == "RandomNumShort[int]" goto RandomNumShort
if "%command%" == "RandomNum[int]" goto RandomNum
if "%command%" == "GrabMeADrink[str]" goto GrabMeADrink
if "%command%" == "Loop[fnc]" goto Loop
if "%command%" == "Sleep[fnc]" goto Sleep
if "%command%" == "EnterMatrix[fnc]" goto EnterMatrix
if "%command%" == "EnterMatrixHacker[fnc]" goto EnterMatrixHacker
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

:EnterMatrix
color 0a
:matrix
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
goto matrix

:c2
set /p command=~
if "%command%" == "HelloWorld[str]" goto HelloWorld
if "%command%" == "RandomNumMinimum[int]" goto RandomNumMinimum
if "%command%" == "RandomNumShort[int]" goto RandomNumShort
if "%command%" == "RandomNum[int]" goto RandomNum
if "%command%" == "GrabMeADrink[str]" goto GrabMeADrink
if "%command%" == "Loop[fnc]" goto Loop
if "%command%" == "Sleep[fnc]" goto Sleep
if "%command%" == "EnterMatrix[fnc]" goto EnterMatrix
if "%command%" == "EnterMatrixHacker[fnc]" goto EnterMatrixHacker
goto c2