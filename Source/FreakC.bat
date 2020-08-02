@echo off
title FreakC Compiler
:menu 
cls
echo FreakC Compiler Menu
echo.
echo.
echo.
echo.
echo Enter file name to compile:
set /p a=
set option=interpreter
call FCC.bat
goto menu