@echo off
setlocal enabledelayedexpansion
if "%1" == "" fcshell
if "%2" == "--compile" set fccompile=true
set fccompilename=%1
set a=%fccompilename:.fclang=%
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	for %%a in (%%x) do (
		set printString=%%x
		if %%a == Swear[fnc] echo !printString:Swear[fnc]=echo!>>%a%.bat
		if %%a == SwearLine[fnc] echo !printString:SwearLine[fnc]=echo.!>>%a%.bat
		if %%a == PukeDir[fnc] echo !printString:PukeDir[fnc]=md!>>%a%.bat
		if %%a == EatDir[fnc] echo !printString:EatDir[fnc]=cd!>>%a%.bat
		if %%a == Trash[fnc] echo !printString:Trash[fnc]=del!>>%a%.bat
		if %%a == TrashDir[fnc] echo !printString:TrashDir[fnc]=rmdir!>>%a%.bat
		if %%a == EatDrive[fnc] echo !printString:EatDrive[fnc] =!:>>%a%.bat
		if %%a == StealDiary[fnc] echo !printString:StealDiary[fnc]=type!>>%a%.bat
		if %%a == ReadDiary[fnc] echo !printString:ReadDiary[fnc]=call!>>%a%.bat
		if %%a == HackerMan[fnc] echo !printString:HackerMan[fnc] =!>>%a%.bat
		if %%a == WaitForBus[fnc] echo !printString:WaitForBus[fnc]=timeout /t! /nobreak>>%a%.bat
		if %%a == OddOrEven[fnc] (
			set /a num=!printString:~14! %% 2
			if !num! == 0 echo echo Is even>>%a%.bat
			if not !num! == 0 echo echo Is odd>>%a%.bat
		)
		if %%a == PoopInt[fnc] echo !printString:PoopInt[fnc]=set /a!>>%a%.bat
		if %%a == PoopString[fnc] echo !printString:PoopString[fnc]=set!>>%a%.bat
		if %%a == PoopInput[fnc] echo !printString:PoopInput[fnc]=set /p!>>%a%.bat
		if %%a == PoopFnc[fnc] echo :!printString:PoopFnc[fnc] =!>>%a%.bat
		if %%a == EatFnc[fnc] echo !printString:EatFnc[fnc]=goto!>>%a%.bat
		if %%a == GrabFnc[fnc] echo !printString:GrabFnc[fnc]=call!>>%a%.bat
		if %%a == ChangeColor[fnc] echo !printString:ChangeColor[fnc]=color!>>%a%.bat
		if %%a == ChangeName[fnc] echo !printString:ChangeName[fnc]=title!>>%a%.bat
		if %%a == ChangeSize[fnc] echo !printString:ChangeSize[fnc]=mode!>>%a%.bat
		if %%a == RenameFile[fnc] echo !printString:RenameFile[fnc]=ren!>>%a%.bat
		if %%a == MoveFile[fnc] echo !printString:MoveFile[fnc]=move!>>%a%.bat
		if %%a == CopyFile[fnc] echo !printString:CopyFile[fnc]=copy!>>%a%.bat
		if %%a == PlayFile[fnc] echo !printString:PlayFile[fnc]=start!>>%a%.bat
	)
	if %%x == Die[fnc] echo exit>>%a%.bat
	if %%x == Loop[fnc] echo goto FreakCCompiled>>%a%.bat
	if %%x == ShutdownSystem[fnc] echo shutdown -s -t 0>>%a%.bat
	if %%x == RestartSystem[fnc] echo shutdown -r -t 0>>%a%.bat
	if %%x == Forget[fnc] echo cls>>%a%.bat
	if %%x == GotoToilet[fnc] echo pause>>%a%.bat
	if %%x == OpenHouse[fnc] echo SETLOCAL>>%a%.bat
	if %%x == CloseHouse[fnc] echo ENDLOCAL>>%a%.bat
	if %%x == SeeTime[fnc] echo date /t>>%a%.bat
	if %%x == SeeDate[fnc] echo time /t>>%a%.bat
	if %%x == MyMemory[fnc] echo dir>>%a%.bat
)
echo pause>>%a%.bat
if not "%fccompile%" == "true" call %a%.bat
@echo on