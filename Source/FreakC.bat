@echo off
setlocal enabledelayedexpansion
if "%1" == "" (
	echo.
	echo.
	echo. Usage: freakc {option/name} {option}
	echo.
	echo.
	echo. Options:
	echo.
	echo.  --version  :Have to be the first parameter, shows the current version of the DevKit.
	echo.  --compile  :Have to be the second parameter, compile the file only.
	echo.  --candr    :Have to be the second parameter, compile and shows compiled code.
	echo.  --create   :Have to be the second parameter, create a new FreakC project.
	echo.
	echo. [Leave the second {option} blank if you want to both compile and run the file]
	echo.
	echo.
	pause >nul
	exit /b
)
if "%1" == "--version" goto fcversion
if "%2" == "--compile" (
	set fccompile=true
) else if "%2" == "--candr" (
	set fcread=true
) else if "%2" == "--create" (
	set fccreate=true
)
set fccompilename=%1
set a=%fccompilename:.fclang=%
if "%fccreate%" == "true" (
	md %a%
	cd %a%
	echo.>>%a%.fclang
	exit /b
)
set fccomment=false
set wloopnum=0
set wloopnum2=0
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
		if "%%a" == "[cmt]" (
			set fccomment=true
			set printString=!printString:[cmt]=!
		)
		if "%%a" == "[ecmt]" (
			set fccomment=false
			set printString=!printString:[ecmt]=!
		)
		if "%%a" == "[hcmt]" (
			echo.>>%a%.bat
			set deniedToken=true
		)
		if %%a == InsertShits[fnc] (
			type !printString:InsertShits[fnc] =!>>%a%.bat
			set deniedToken=true
		)
		if %%a == Cancer[fnc] (
			echo.>%a%.bat
			set deniedToken=true
		)
		if %%a == EatDrive[fnc] set printString=!printString:EatDrive[fnc] =!:
		if %%a == TryMeBtch[fnc] (
			set tmb=!printString:TryMeBtch[fnc] =!
			echo if !tmb! echo Yes>>%a%.bat
			echo if not !tmb! echo No>>%a%.bat
			set deniedToken=true
		)
		if %%a == TryMeHoe[fnc] (
			set tmb=!printString:TryMeHoe[fnc] =!
			echo if !tmb! set tmhres=Yes>>%a%.bat
			echo if not !tmb! set tmhres=No>>%a%.bat
			set deniedToken=true
		)
		if %%a == FuckUp[fnc] (
			set prob=!printString:FuckUp[fnc] =!
			echo set /a fusolved=!prob!>>%a%.bat
			echo echo %%fusolved%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == FuckUpLess[fnc] (
			set prob=!printString:FuckUpLess[fnc] =!
			echo set /a fusolved=!prob!>>%a%.bat
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
		if %%a == WhileSuck[fnc] (
			set fccondition=!printString:WhileSuck[fnc] =!
			echo :WhileLoop!wloopnum!>>%a%.bat
			echo if not !fccondition! goto EndLoop!wloopnum!>>%a%.bat
			set deniedToken=true
		)
		if %%a == EndSuck[fnc] (
			echo goto WhileLoop!wloopnum!>>%a%.bat
			echo :EndLoop!wloopnum!>>%a%.bat
			set /a wloopnum=!wloopnum!+1
			set deniedToken=true
		)
		if %%a == RepeatSuck[fnc] (
			echo :RepeatSuck!wloopnum!>>%a%.bat
			set deniedToken=true
		)
		if %%a == UntilStale[fnc] (
			set fccondition2=!printString:UntilStale[fnc] =!
			echo if not !fccondition2! goto RealStale!wloopnum2!>>%a%.bat
			echo goto RepeatSuck!wloopnum2!>>%a%.bat
			echo :RealStale!wloopnum2!>>%a%.bat
			set /a wloopnum2=!wloopnum2!+1
			set deniedToken=true
		)
		if %%a == CubeMyBois[fnc] (
			set sqmb=!printString:CubeMyBois[fnc] =!
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
		if %%a == Puke[typ] (
			set printString=!printString:Puke[typ]=set /a!
			set printString=!printString:++=+=1!
			set printString=!printString:--=-=1!
		)
		if %%a == PoopString[fnc] set printString=!printString:PoopString[fnc]=set!
		if %%a == Shit[typ] set printString=!printString:Shit[typ]=set!
		if %%a == PoopInput[fnc] set printString=!printString:PoopInput[fnc]=set /p!
		if %%a == Piss[typ] set printString=!printString:Piss[typ]=set /p!
		if %%a == EatFnc[fnc] set printString=!printString:EatFnc[fnc]=goto!
		if %%a == GrabFnc[fnc] set printString=!printString:GrabFnc[fnc]=call!
		if %%a == LickFnc[fnc] set printString=!printString:LickFnc[fnc] =call :!
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
		if %%a == Cum[typ]  set printString=!printString:Cum[typ] =:!
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
		if %%a == HelloWorld[str] set printString=!printString:HelloWorld[str]=echo Hello, World!
		if %%a == GrabMeADrink[str] set printString=!printString:GrabMeADrink[str]=echo Grab me a drink, mate!
		if %%a == ILoveYou[str] set printString=!printString:ILoveYou[str]=echo I Love You!
		if %%a == AreYaWinningSon[str] set printString=!printString:AreYaWinningSon[str]=echo Are ya winning son ?!
		if %%a == Java[str] set printString=!printString:Java[str]=echo Cringe!
		if %%a == Java[fnc] set printString=!printString:Java[fnc]=echo This is FreakC, mate!
		if %%a == Java[meme] set printString=!printString:Java[meme]=echo Write once, bugs everywhere!
		if %%a == JSON[str] set printString=!printString:JSON[str]=echo {"{}":{"{}":{}}}!
		if %%a == HiM8[str] set printString=!printString:HiM8[str]=echo Hi mate!
		if %%a == FuckUnicode[fnc] set printString=!printString:FuckUnicode[fnc]=chcp 65001!
		if %%a == Patrick[meme] (
			if "!printString:Patrick[meme] =!" == "1" (
				set printString=echo Is mayonnaise an instrument ?
			) else if "!printString:Patrick[meme] =!" == "2" (
				set printString=echo Roses are blue, violets are red, I have to go to the bathroom.
			) else if "!printString:Patrick[meme] =!" == "3" (
				set printString=echo I can't see my forehead.
			) else if "!printString:Patrick[meme] =!" == "4" (
				set printString=echo The inner machinations of my mind are an enigma.
			) else if "!printString:Patrick[meme] =!" == "5" (
				set printString=echo Once upon a time there was an ugly barnacle. He was so ugly that everyone died. The end!
			) else if "!printString:Patrick[meme] =!" == "6" (
				set printString=echo I wumbo, you wumbo, he she we wumbo.
			) else if "!printString:Patrick[meme] =!" == "7" (
				set printString=echo Two words, SpongeBob. Na. Chos.
			) else (
				set printString=echo No meme here :(
			)
		)
		if %%a == Dani[meme] (
			if "!printString:Dani[meme] =!" == "mom" (
				set printString=echo Not as thicc as your mom hehe.
			) else if "!printString:Dani[meme] =!" == "cool" (
				echo :Dani>>%a%.bat
				echo echo Wow that's was really cool.>>%a%.bat
				echo goto Dani>>%a%.bat
				set deniedToken=true
			) else if "!printString:Dani[meme] =!" == "billy" (
				set printString=echo Freak you billy.
			) else if "!printString:Dani[meme] =!" == "unity" (
				echo :DaniUnity>>%a%.bat
				echo echo Unity's Particle System>>%a%.bat
				echo goto DaniUnity>>%a%.bat
				set deniedToken=true
			) else (
				set printString=echo No meme here :(
			)
		)
		if %%a == SpongeBob[meme] (
			if "!printString:SpongeBob[meme] =!" == "1" (
				set printString=echo Ravioli, ravioli, give me formuoli. 
			) else (
				set printString=echo No meme here :(
			)
		)
		if %%a == FindTrash[fnc] set printString=!printString:FindTrash[fnc]=findstr!
		if %%a == FindShits[fnc] set printString=!printString:FindShits[fnc]=find!
		if %%a == Thicc[meme] set printString=echo Damn boi... Damn boi... Damn boi he thicc boia, that's a thicc ass boi
	)
	if "!fccomment!" == "false" (
		if not "!deniedToken!" == "true" echo. !printString!>>%a%.bat
	) else (
		echo. ::!printString!>>%a%.bat
	)
)
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %a%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %a%.bat
exit /b
:fcversion
echo FreakC DevKit Version 3.22.0
exit /b