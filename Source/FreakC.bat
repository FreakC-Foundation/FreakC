@echo off
setlocal enabledelayedexpansion
if "%1" == "" (
	echo.
	echo.    **************                              ******          **********
	echo.   ****************                             *** ***        ************
	echo.  ****   ****                                   *** ***       ****      ***
	echo.  ***    ****                                   *** ***      ***        ***
	echo.  ***    ****                                   *******     ***         **
	echo.  **  ************ **   **     **       *****   ********   ***
	echo.     ************* ** *****  ******    *******  *********  ***
	echo.      ************ ********* *******  ********* ********** ***
	echo.        *****      ********* ***  ** ********** ********** ***
	echo.         ****      ****  *** ***  ** ****  **** **********  ***  
	echo.  **     ****      ***    ** ******* ****  **** **********   ***          **
	echo.  ***    ****      ***    ** ******* ********** **********    ****       **
	echo.  **********       ***       ******* ********** ****   ***      **********
	echo.    ******         ***         ****** *****  ** ***    ***       ********
	echo.
	echo.
	echo. Usage: freakc {option/name} {option}
	echo.
	echo. Options:
	echo.
	echo.  --help     :Have to be the first parameter, shows all options
	echo.  --shell    :Have to be the first parameter, open shell.
	echo.  --version  :Have to be the first parameter, shows the current version of the DevKit.
	echo.  --compile  :Have to be the second parameter, compile the file only.
	echo.  --candr    :Have to be the second parameter, compile and shows compiled code.
	echo.  --create   :Have to be the second parameter, create a new FreakC project.
	echo.
	echo. [Leave the second {option} blank if you want to both compile and run the file]
	pause >nul
	exit /b
)
if "%1" == "--help" (
	echo. Usage: freakc {option/name} {option}
	echo.
	echo. Options:
	echo.
	echo.  --help     :Have to be the first parameter, shows all options
	echo.  --shell    :Have to be the first parameter, open shell.
	echo.  --version  :Have to be the first parameter, shows the current version of the DevKit.
	echo.  --compile  :Have to be the second parameter, compile the file only.
	echo.  --candr    :Have to be the second parameter, compile and shows compiled code.
	echo.  --create   :Have to be the second parameter, create a new FreakC project.
	echo.
	echo. [Leave the second {option} blank if you want to both compile and run the file]
	exit /b
)
if "%1" == "--version" goto fcversion
if "%2" == "--compile" (
	set fccompile=true
) else if "%2" == "--candr" (
	set fcread=true
) else if "%2" == "--create" (
	set fccreate=true
) else if "%1" == "--shell" (
	FCShell
	exit /b
)
set fccompilename=%1
set a=%fccompilename:.fclang=%
if "%fccreate%" == "true" (
	md %a%
	cd %a%
	if "%3" == "--empty" (
		echo.>%a%.fclang
	) else (
		echo Swear[fnc] Hello World, Hello FreakC>%a%.fclang
	)
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
		if %%a == Fuck[fnc] (
			set lib=!printString:Fuck[fnc] =!
			if "!lib!" == "float" (
				echo for /f %%%%i in ('powershell %%~2'^) DO set %%~1=%%%%i>fclib_float.bat
				set deniedToken=true
				set floatimp=true
			) else if "!lib!" == "arrayfunc" (
				(
				echo set max=1
				echo for %%%%i in ^(%%~2^) DO (
				echo 	set max=%%%%i
				echo 	goto fcmaxend
				echo ^)
				echo :fcmaxend
				echo for %%%%i in (%%~2^) DO (
				echo 	if %%%%i GTR %%max%% (
				echo 		set max=%%%%i
				echo 	^)
				echo ^)
				echo set %%~1=%%max%%
				)>fclib_arrayfunc_max.bat
				(
				echo set min=1
				echo for %%%%i in ^(%%~2^) DO (
				echo 	set min=%%%%i
				echo 	goto fcminend
				echo ^)
				echo :fcminend
				echo for %%%%i in (%%~2^) DO (
				echo 	if %%%%i LSS %%min%% (
				echo 		set min=%%%%i
				echo 	^)
				echo ^)
				echo set %%~1=%%min%%
				)>fclib_arrayfunc_min.bat
				(
				echo set sum=0
				echo for %%%%i in ^(%%~2^) DO set /a sum+=%%%%i
				echo set %%~1=%%sum%%
				)>fclib_arrayfunc_sum.bat
				set deniedToken=true
			) else if "!lib!" == "math" (
				(
				echo set tar=%%~2
				echo set %%~1=%%tar:-=%%
				)>fclib_math_abs.bat
				(
				echo set /a res=%%~2 %%%% 2
				echo if %%res%% == 0 (
				echo 	set %%~1=true
				echo ^) else (
				echo 	set %%~1=false
				echo ^)
				)>fclib_math_even.bat
				(
				echo set /a res=%%~2 %%%% 2
				echo if %%res%% == 0 (
				echo 	set %%~1=false
				echo ^) else (
				echo 	set %%~1=true
				echo ^)
				)>fclib_math_odd.bat
				(
				echo set res=%%~2
				echo set /a t=%%~3 - 1
				echo for /l %%%%i in (1,1,%%t%%^) do (
				echo 	set /a res*=%%res%%
				echo ^)
				echo set %%~1=%%res%%
				)>fclib_math_pow.bat
				(
				echo set /a num1=0
				echo set /a num2=1
				echo set /a num3=0
				echo set str=1
				echo :loop
				echo if not %%num3%% LSS %%~2 goto end
 				echo set /a num3=%%num1%% + %%num2%%
 				echo set str=%%str%% %%num3%%
 				echo set /a num1=%%num2%%
 				echo set /a num2=%%num3%%
				echo goto loop
				echo :end
				echo set %%~1=%%str%%
				)>fclib_math_fibseq.bat
				(
				echo set /a num1=0
				echo set /a num2=1
				echo set /a num3=0
				echo :loop
				echo if not %%num3%% LSS %%~2 goto end
 				echo set /a num3=%%num1%% + %%num2%%
 				echo set /a num1=%%num2%%
 				echo set /a num2=%%num3%%
				echo goto loop
				echo :end
				echo set %%~1=%%num3%%
				)>fclib_math_fib.bat
				set deniedToken=true
			) else if "!lib!" == "string" (
				(
				echo set lower=%%~2
				echo set lower=%%lower:A=a%%
				echo set lower=%%lower:B=b%%
				echo set lower=%%lower:C=c%%
				echo set lower=%%lower:D=d%%
				echo set lower=%%lower:E=e%%
				echo set lower=%%lower:F=f%%
				echo set lower=%%lower:G=g%%
				echo set lower=%%lower:H=h%%
				echo set lower=%%lower:I=i%%
				echo set lower=%%lower:J=j%%
				echo set lower=%%lower:K=k%%
				echo set lower=%%lower:L=l%%
				echo set lower=%%lower:M=m%%
				echo set lower=%%lower:N=n%%
				echo set lower=%%lower:O=o%%
				echo set lower=%%lower:P=p%%
				echo set lower=%%lower:Q=q%%
				echo set lower=%%lower:R=r%%
				echo set lower=%%lower:S=s%%
				echo set lower=%%lower:T=t%%
				echo set lower=%%lower:U=u%%
				echo set lower=%%lower:V=v%%
				echo set lower=%%lower:W=w%%
				echo set lower=%%lower:X=x%%
				echo set lower=%%lower:Y=y%%
				echo set lower=%%lower:Z=z%%
				echo set %%~1=%%lower%%
				)>fclib_string_lower.bat
				(
				echo set upper=%%~2
				echo set upper=%%upper:a=A%%
				echo set upper=%%upper:b=B%%
				echo set upper=%%upper:c=C%%
				echo set upper=%%upper:d=D%%
				echo set upper=%%upper:e=E%%
				echo set upper=%%upper:f=F%%
				echo set upper=%%upper:g=G%%
				echo set upper=%%upper:h=H%%
				echo set upper=%%upper:i=I%%
				echo set upper=%%upper:j=J%%
				echo set upper=%%upper:k=K%%
				echo set upper=%%upper:l=L%%
				echo set upper=%%upper:m=M%%
				echo set upper=%%upper:n=N%%
				echo set upper=%%upper:o=O%%
				echo set upper=%%upper:p=P%%
				echo set upper=%%upper:q=Q%%
				echo set upper=%%upper:r=R%%
				echo set upper=%%upper:s=S%%
				echo set upper=%%upper:t=T%%
				echo set upper=%%upper:u=U%%
				echo set upper=%%upper:v=V%%
				echo set upper=%%upper:w=W%%
				echo set upper=%%upper:x=X%%
				echo set upper=%%upper:y=Y%%
				echo set upper=%%upper:z=Z%%
				echo set %%~1=%%upper%%
				)>fclib_string_upper.bat
				(
				echo setlocal enabledelayedexpansion
				echo set len=0
				echo set str=%%~2
				echo :loop
				echo if not "^!str:^~%%len%%^!" == "" set /a len+=1 ^& goto loop
				echo (endlocal ^& set %%~1=%%len%%^)
				)>fclib_string_length.bat
				set deniedToken=true
			) else (
				set deniedToken=true
			)
		)
		if %%a == MeasurePenisSize[fnc] set printString=!printString:MeasurePenisSize[fnc]=call fclib_string_length.bat!
		if %%a == BeingHorny[fnc] set printString=!printString:BeingHorny[fnc]=call fclib_string_upper.bat!
		if %%a == WipePenis[fnc] set printString=!printString:WipePenis[fnc]=call fclib_string_lower.bat!
		if %%a == HugeCum[fnc] set printString=!printString:HugeCum[fnc]=call fclib_math_fibseq.bat!
		if %%a == NotThatHugeCum[fnc] set printString=!printString:NotThatHugeCum[fnc]=call fclib_math_fib.bat!
		if %%a == CheckIfUrDumb[fnc] set printString=!printString:CheckIfUrDumb[fnc]=call fclib_math_odd.bat!
		if %%a == CheckIfUrStupid[fnc] set printString=!printString:CheckIfUrStupid[fnc]=call fclib_math_even.bat!
		if %%a == Masturbate[fnc] set printString=!printString:Masturbate[fnc]=call fclib_math_pow.bat!
		if %%a == AdmitUrDumb[fnc] set printString=!printString:AdmitUrDumb[fnc]=call fclib_math_abs.bat!
		if %%a == Bitchiest[fnc] set printString=!printString:Bitchiest[fnc]=call fclib_arrayfunc_max.bat!
		if %%a == Horniest[fnc] set printString=!printString:Horniest[fnc]=call fclib_arrayfunc_min.bat!
		if %%a == CountBitches[fnc] set printString=!printString:CountBitches[fnc]= call fclib_arrayfunc_sum.bat!
		if %%a == HackLikeABoss[fnc] (
			set tar=!printString:HackLikeABoss[fnc] =!
			(
			echo echo Hacking !tar! 20%%%%
			echo timeout /t 1 /nobreak ^>nul
			echo echo Hacking !tar! 40%%%%
			echo timeout /t 1 /nobreak ^>nul
			echo echo Hacking !tar! 60%%%%
			echo timeout /t 1 /nobreak ^>nul
			echo echo Hacking !tar! 80%%%%
			echo timeout /t 1 /nobreak ^>nul
			echo echo Hacking !tar! 100%%%%
			)>>!a!.bat
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
			echo set /a fcooeres=!printString:OddOrEven[fnc] =! %%%% ^2>>%a%.bat
			echo if %%fcooeres%% == 0 echo Is even! >>%a%.bat
			echo if not %%fcooeres%% == 0 echo Is odd! >>%a%.bat
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
		if %%a == PoopFloat[fnc] set printString=!printString:PoopFloat[fnc]=call fclib_float.bat!
		if %%a == Jelly[typ] set printString=!printString:Jelly[typ]=call fclib_float.bat!
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
			set patarg=!printString:Patrick[meme] =!
			if "!patarg!" == "1" (
				set printString=echo Is mayonnaise an instrument ?
			) else if "!patarg!" == "2" (
				set printString=echo Roses are blue, violets are red, I have to go to the bathroom.
			) else if "!patarg!" == "3" (
				set printString=echo I can't see my forehead.
			) else if "!patarg!" == "4" (
				set printString=echo The inner machinations of my mind are an enigma.
			) else if "!patarg!" == "5" (
				set printString=echo Once upon a time there was an ugly barnacle. He was so ugly that everyone died. The end!
			) else if "!patarg!" == "6" (
				set printString=echo I wumbo, you wumbo, he she we wumbo.
			) else if "!patarg!" == "7" (
				set printString=echo Two words, SpongeBob. Na. Chos.
			) else (
				set printString=echo No meme here :(
			)
		)
		if %%a == Dani[meme] (
			set daniarg=!printString:Dani[meme] =!
			if "!daniarg!" == "mom" (
				set printString=echo Not as thicc as your mom hehe.
			) else if "!daniarg!" == "cool" (
				echo :Dani>>%a%.bat
				echo echo Wow that's was really cool.>>%a%.bat
				echo goto Dani>>%a%.bat
				set deniedToken=true
			) else if "!daniarg!" == "billy" (
				set printString=echo Freak you billy.
			) else if "!daniarg!" == "unity" (
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
		if %%a == SummonLegend[fnc] set printString=!printString:SummonLegend[fnc]=start https://www.youtube.com/watch?v=dQw4w9WgXcQ!
		if %%a == FindTrash[fnc] set printString=!printString:FindTrash[fnc]=findstr!
		if %%a == FindShits[fnc] set printString=!printString:FindShits[fnc]=find!
		if %%a == Thicc[meme] set printString=echo Damn boi... Damn boi... Damn boi he thicc boia, that's a thicc ass boi
		if %%a == DumbCousin[fnc] set printString=!printString:DumbCousin[fnc]=powershell!
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
echo FreakC DevKit Version 4.5.0
exit /b