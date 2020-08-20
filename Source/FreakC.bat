@echo off
setlocal enabledelayedexpansion
if "%1" == "" fcshell
if "%2" == "--compile" set fccompile=true
set fccompilename=%1
set a=%fccompilename:.fclang=%
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	set printString=%%x
	for %%a in (%%x) do (
		if %%a == EatDrive[fnc] set printString=!printString:EatDrive[fnc] =!:
		if %%a == OddOrEven[fnc] (
			set /a num=!printString:~14! %% 2
			if !num! == 0 echo echo Is even>>%a%.bat
			if not !num! == 0 echo echo Is odd>>%a%.bat
		)
		if %%a == WaitForBus[fnc] set printString=!printString:WaitForBus[fnc]=timeout /t! /nobreak
		if %%a == PoopFnc[fnc] set printString=:!printString:PoopFnc[fnc] =!
	)
	set printString=!printString:Swear[fnc]=echo!
	set printString=!printString:SwearLine[fnc]=echo.!
	set printString=!printString:PukeDir[fnc]=md!
	set printString=!printString:EatDir[fnc]=cd!
	set printString=!printString:Trash[fnc]=del!
	set printString=!printString:TrashDir[fnc]=rmdir!
	set printString=!printString:StealDiary[fnc]=type!
	set printString=!printString:HackerMan[fnc] =!
	set printString=!printString:PoopInt[fnc]=set /a!
	set printString=!printString:PoopString[fnc]=set!
	set printString=!printString:PoopInput[fnc]=set /p!
	set printString=!printString:EatFnc[fnc]=goto!
	set printString=!printString:GrabFnc[fnc]=call!
	set printString=!printString:ChangeColor[fnc]=color!
	set printString=!printString:ChangeSize[fnc]=mode!
	set printString=!printString:ChangeName[fnc]=title!
	set printString=!printString:RenameFile[fnc]=ren!
	set printString=!printString:MoveFile[fnc]=move!
	set printString=!printString:CopyFile[fnc]=copy!
	set printString=!printString:PlayFile[fnc]=start!
	set printString=!printString:Die[fnc]=exit!
	set printString=!printString:Loop[fnc]=goto FreakCCompiled!
	set printString=!printString:ShutdownSystem[fnc]=shutdown -s -t 0!
	set printString=!printString:RestartSystem[fnc]=shutdown -r -t 0!
	set printString=!printString:Forget[fnc]=cls!
	set printString=!printString:GotoToilet[fnc]=pause!
	set printString=!printString:OpenHouse[fnc]=SETLOCAL!
	set printString=!printString:CloseHouse[fnc]=ENDLOCAL!
	set printString=!printString:SeeTime[fnc]=date /t!
	set printString=!printString:SeeDate[fnc]=time /t!
	set printString=!printString:MyMemory[fnc]=dir!
	set printString=!printString:DoIf[fnc]=if!
	echo !printString!>>%a%.bat
)
echo pause>>%a%.bat
if not "%fccompile%" == "true" call %a%.bat
@echo on