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
	)
	set printString=!printString:Swear[fnc]=echo!
	set printString=!printString:SwearLine[fnc]=echo.!
	set printString=!printString:PukeDir[fnc]=md!
	set printString=!printString:EatDir[fnc]=cd!
	set printString=!printString:Trash[fnc]=del!
	set printString=!printString:TrashDir[fnc]=rmdir!
	set printString=!printString:StealDiary[fnc]=type!
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
	set printString=!printString:DoIfFalse[fnc]=if not!
	set printString=!printString:DoIfDefined[fnc]=if defined!
	set printString=!printString:DoIfExist[fnc]=if defined!
	set printString=!printString:PoopFnc[fnc] =:!
	set printString=!printString:WaitForBus[fnc]=timeout /nobreak /t!
	set printString=!printString:-fc0c1=a!
	set printString=!printString:-fc0c2=b!
	set printString=!printString:-fc0c3=c!
	set printString=!printString:-fc0c4=d!
	set printString=!printString:-fc0c5=e!
	set printString=!printString:-fc0c6=f!
	set printString=!printString:-fc0c7=g!
	set printString=!printString:-fc0c8=h!
	set printString=!printString:-fc0c9=i!
	set printString=!printString:-fc1c1=j!
	set printString=!printString:-fc1c2=k!
	set printString=!printString:-fc1c3=l!
	set printString=!printString:-fc1c4=m!
	set printString=!printString:-fc1c5=n!
	set printString=!printString:-fc1c6=o!
	set printString=!printString:-fc1c7=p!
	set printString=!printString:-fc1c8=q!
	set printString=!printString:-fc1c9=r!
	set printString=!printString:-fc2c1=s!
	set printString=!printString:-fc2c2=t!
	set printString=!printString:-fc2c3=u!
	set printString=!printString:-fc2c4=v!
	set printString=!printString:-fc2c5=w!
	set printString=!printString:-fc2c6=x!
	set printString=!printString:-fc2c7=y!
	set printString=!printString:-fc2c8=z!
	set printString=!printString:-fc0a1=A!
	set printString=!printString:-fc0a2=B!
	set printString=!printString:-fc0a3=C!
	set printString=!printString:-fc0a4=D!
	set printString=!printString:-fc0a5=E!
	set printString=!printString:-fc0a6=F!
	set printString=!printString:-fc0a7=G!
	set printString=!printString:-fc0a8=H!
	set printString=!printString:-fc0a9=I!
	set printString=!printString:-fc1a1=J!
	set printString=!printString:-fc1a2=K!
	set printString=!printString:-fc1a3=L!
	set printString=!printString:-fc1a4=M!
	set printString=!printString:-fc1a5=N!
	set printString=!printString:-fc1a6=O!
	set printString=!printString:-fc1a7=P!
	set printString=!printString:-fc1a8=Q!
	set printString=!printString:-fc1a9=R!
	set printString=!printString:-fc2a1=S!
	set printString=!printString:-fc2a2=T!
	set printString=!printString:-fc2a3=U!
	set printString=!printString:-fc2a4=V!
	set printString=!printString:-fc2a5=W!
	set printString=!printString:-fc2a6=X!
	set printString=!printString:-fc2a7=Y!
	set printString=!printString:-fc2a8=Z!
	if not "!printString!" == "" echo. !printString!>>%a%.bat
)
echo pause>>%a%.bat
if not "%fccompile%" == "true" call %a%.bat
@echo on