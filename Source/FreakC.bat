@echo off
setlocal enabledelayedexpansion
if "%1" == "" (
	echo.
	echo.
	echo. Usage: freakc {option/file} {option}
	echo.
	echo.
	echo. Options:
	echo.
	echo.  --version  :Should be the first parameter, shows the current version of the DevKit.
	echo.  --compile  :Should be the second parameter, compile the file only.
	echo.  --candr    :Should be the second parameter, compile and shows compiled code.
	echo.
	echo.  [Don't use any options above to compile and run the file at the same time]
	pause >nul
	exit /b
)
if "%1" == "--version" goto fcversion
if "%2" == "--compile" (
	set fccompile=true
) else if "%2" == "--candr" (
	set fcread=true
)
set fccompilename=%1
set a=%fccompilename:.fclang=%
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
echo set /a numpuke=%%random%% %%%% 99 + 1 >>%a%.bat
echo set /a numpoop=%%random%% %%%% 999 + 1 >>%a%.bat
echo set /a numpiss=%%random%% %%%% 9 + 1 >>%a%.bat
echo set /a numdiarrhea=%%random%% %%%% 9999 + 1 >>%a%.bat
echo set /a numbutt=%%random%% %%%% 99999 + 1 >>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	set deniedToken=false
	set printString=%%x
	for %%a in (%%x) do (
		if %%a == EatDrive[fnc] set printString=!printString:EatDrive[fnc] =!:
		if %%a == TryMeBtch[fnc] (
			set tmb=!printString:TryMeBtch[fnc] =!
			echo if !tmb! echo Yes>>%a%.bat
			echo if not !tmb! echo No>>%a%.bat
			set deniedToken=true
		)
		if %%a == CoolHackerMan[fnc] (
			echo :CoolHackerMan>>%a%.bat
			echo echo %%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%%%random%%>>%a%.bat
			echo goto CoolHackerMan>>%a%.bat
			set deniedToken=true
		)
		if %%a == OddOrEven[fnc] (
			set /a num=!printString:~14! %% 2
			echo if !num! == 0 echo Is even! >>%a%.bat
			echo if not !num! == 0 echo Is odd! >>%a%.bat
			set deniedToken=true
		)
		if %%a == SquareMyBois[fnc] (
			set sqmb=!printString:SquareMyBois[fnc] =!
			echo set /a !sqmb!=%%!sqmb!%% * %%!sqmb!%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == CubeMyBois[fnc] (
			set sqmb=!printString:SquareMyBois[fnc] =!
			echo set /a !sqmb!=%%!sqmb!%% * %%!sqmb!%% * %%!sqmb!%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == TapSomeSht[fnc] set printString=!printString:TapSomeSht[fnc] =CHOICE /C:! /N
		if %%a == Swear[fnc] set printString=!printString:Swear[fnc]=echo!
		if %%a == SwearLine[fnc] set printString=!printString:SwearLine[fnc]=echo.!
		if %%a == PukeDir[fnc] set printString=!printString:PukeDir[fnc]=md!
		if %%a == EatDir[fnc] set printString=!printString:EatDir[fnc]=cd!
		if %%a == Trash[fnc] set printString=!printString:Trash[fnc]=del!
		if %%a == TrashDir[fnc] set printString=!printString:TrashDir[fnc]=rmdir!
		if %%a == StealDiary[fnc] set printString=!printString:StealDiary[fnc]=type!
		if %%a == PoopInt[fnc] (
			set printString=!printString:PoopInt[fnc]=set /a!
			set printString=!printString:++=+=1!
			set printString=!printString:--=-=1!
		)
		if %%a == PoopString[fnc] set printString=!printString:PoopString[fnc]=set!
		if %%a == PoopInput[fnc] set printString=!printString:PoopInput[fnc]=set /p!
		if %%a == EatFnc[fnc] set printString=!printString:EatFnc[fnc]=goto!
		if %%a == GrabFnc[fnc] set printString=!printString:GrabFnc[fnc]=call!
		if %%a == ChangeColor[fnc] set printString=!printString:ChangeColor[fnc]=color!
		if %%a == ChangeSize[fnc] set printString=!printString:ChangeSize[fnc]=mode!
		if %%a == ChangeName[fnc] set printString=!printString:ChangeName[fnc]=title!
		if %%a == RenameFile[fnc] set printString=!printString:RenameFile[fnc]=ren!
		if %%a == MoveFile[fnc] set printString=!printString:MoveFile[fnc]=move!
		if %%a == CopyFile[fnc] set printString=!printString:CopyFile[fnc]=copy!
		if %%a == PlayFile[fnc] set printString=!printString:PlayFile[fnc]=start!
		if %%a == Die[fnc] set printString=!printString:Die[fnc]=exit!
		if %%a == Loop[fnc] set printString=!printString:Loop[fnc]=goto FreakCCompiled!
		if %%a == ShutdownSystem[fnc] set printString=!printString:ShutdownSystem[fnc]=shutdown -s -t 0!
		if %%a == RestartSystem[fnc] set printString=!printString:RestartSystem[fnc]=shutdown -r -t 0!
		if %%a == Forget[fnc] set printString=!printString:Forget[fnc]=cls!
		if %%a == GotoToilet[fnc] set printString=!printString:GotoToilet[fnc]=pause!
		if %%a == OpenHouse[fnc] set printString=!printString:OpenHouse[fnc]=SETLOCAL!
		if %%a == CloseHouse[fnc] set printString=!printString:CloseHouse[fnc]=ENDLOCAL!
		if %%a == SeeTime[fnc] set printString=!printString:SeeTime[fnc]=date /t!
		if %%a == SeeDate[fnc] set printString=!printString:SeeDate[fnc]=time /t!
		if %%a == BuyCalender[fnc] set printString=!printString:BuyCalender[fnc]=date!
		if %%a == BuyClock[fnc] set printString=!printString:BuyClock[fnc]=time!
		if %%a == MyMemory[fnc] set printString=!printString:MyMemory[fnc]=dir!
		if %%a == DoIf[fnc] set printString=!printString:DoIf[fnc]=if!
		if %%a == DoIfTap[fnc] set printString=!printString:DoIfTap[fnc]=if errorlevel!
		if %%a == DoIfNotTap[fnc] set printString=!printString:DoIfNotTap[fnc]=if not errorlevel!
		if %%a == DoIfFalse[fnc] set printString=!printString:DoIfFalse[fnc]=if not!
		if %%a == DoIfDefined[fnc] set printString=!printString:DoIfDefined[fnc]=if defined!
		if %%a == DoIfExist[fnc] set printString=!printString:DoIfExist[fnc]=if exist!
		if %%a == DoIfNotExist[fnc] set printString=!printString:DoIfNotExist[fnc]=if not exist!
		if %%a == DoIfNotDefined[fnc] set printString=!printString:DoIfNotDefined[fnc]=if not defined!
		if %%a == OrNot[fnc] set printString=!printString:OrNot[fnc]=else!
		if %%a == PoopFnc[fnc]  set printString=!printString:PoopFnc[fnc] =:!
		if %%a == WaitForBus[fnc] set printString=!printString:WaitForBus[fnc]=timeout /nobreak /t!
		if %%a == EnableCoolStuff[fnc] set printString=!printString:EnableCoolStuff[fnc]=@echo on!
		if %%a == DisableCoolStuff[fnc] set printString=!printString:DisableCoolStuff[fnc]=@echo off!
		if %%a == LoopStuffs[fnc] set printString=!printString:LoopStuffs[fnc]=for /l!
		if %%a == ScanOrgans[fnc] set printString=!printString:ScanOrgans[fnc]=for /r!
		if %%a == ScanLetters[fnc] set printString=!printString:ScanLetters[fnc]=for /f!
		if %%a == ScanDiaries[fnc] set printString=!printString:ScanDiaries[fnc]=for!
		if %%a == ScanDir[fnc] set printString=!printString:ScanDir[fnc]=for /d!
		if %%a == HackTheNet[fnc] set printString=!printString:HackTheNet[fnc]=ping!
		if %%a == MyDirtyInfo[fnc] set printString=!printString:MyDirtyInfo[fnc]=systeminfo!
		if %%a == HackMyIP[fnc] set printString=!printString:HackMyIP[fnc]=ipconfig /all!
	)
	if not "!deniedToken!" == "true" echo. !printString! >>%a%.bat
)
echo pause ^>nul>>%a%.bat
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %a%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %a%.bat
exit /b
:fcversion
echo FreakC DevKit Version 3.11.0
exit /b