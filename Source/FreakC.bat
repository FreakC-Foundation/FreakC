@echo off
setlocal enabledelayedexpansion
if "%1" == "" (
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
	echo.  --clrlib   :Have to be the first parameter, delete all standard libraries in the folder.
	echo.  --clrbat   :Have to be the first parameter, delete all Batch files in the folder.
	echo.
	echo. [Leave the second {option} blank if you want to both compile and run the file]
	pause >nul
	exit /b
)
set proctar=java
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
	echo.  --clrlib   :Have to be the first parameter, delete all standard libraries in the folder.
	echo.  --clrbat   :Have to be the first parameter, delete all Batch files in the folder.
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
) else if "%1" == "--clrlib" (
	del /q fclib_list_sum.bat 2>nul
	del /q fclib_list_max.bat 2>nul
	del /q fclib_list_min.bat 2>nul
	del /q fclib_math_abs.bat 2>nul
	del /q fclib_math_odd.bat 2>nul
	del /q fclib_math_even.bat 2>nul
	del /q fclib_math_fact.bat 2>nul
	del /q fclib_math_pow.bat 2>nul
	del /q fclib_math_fib.bat 2>nul
	del /q fclib_math_fibseq.bat 2>nul
	del /q fclib_string_upper.bat 2>nul
	del /q fclib_string_lower.bat 2>nul
	del /q fclib_string_length.bat 2>nul
	del /q fclib_string_reverse.bat 2>nul
	del /q fclib_float.bat 2>nul
	exit /b
) else if "%1" == "--clrbat" (
	del *.bat
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
		echo print[] Hello World, Hello FreakC^^!>%a%.fclang
	)
	exit /b
)
set fccomment=false
set wloopnum=0
set wloopnum2=0
set sth=123
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.fclang) do (
	set deniedToken=false
	set printString=%%x
	for %%a in (%%x) do (
		set ch=%%a
		if "!ch:~-4!" == "[..]" (
			set ch=!ch:[..]=!
			for %%i in (!ch!) do set printString=!printString:%%a=call %%i!
		)
		if "!ch:~-4!" == "[::]" (
			set ch=!ch:[::]=!
			for %%i in (!ch!) do set printString=!printString:%%a=call :%%i!
		)
		if "%%a" == "c[]" (
			set fccomment=true
			set printString=!printString:c[]=!
		)
		if "%%a" == "e[]" (
			set fccomment=false
			set printString=!printString:e[]=!
		)
		if "%%a" == "h[]" (
			if "!procadd!" == "true" (
				echo.>>!proctar!.bat
			) else (
				echo.>>%a%.bat
			)
			set deniedToken=true
		)
		if %%a == end[] set printString=!printString:end[]=exit /b 0!
		if %%a == import[] (
			set lib=!printString:import[] =!
			if "!lib!" == "float" (
				echo for /f %%%%i in ('powershell %%~2'^) DO set %%~1=%%%%i>fclib_float.bat
				set deniedToken=true
				set floatimp=true
			) else if "!lib!" == "array" (
				(
				echo set /a len=%%~3-1
				echo setlocal enabledelayedexpansion
				echo set max=^^!%%~2[0]^^!
				echo for %%%%i in (0,1,%%len%%^) do if ^^!%%~2[%%%%i]^^! GTR %%max%% set max=^^!%%~2[%%%%i]^^!
				echo (endlocal ^& set %%~1=%%max%%^)
				)>fclib_array_max.bat
				(
				echo set /a len=%%~3-1
				echo setlocal enabledelayedexpansion
				echo set min=^^!%%~2[0]^^!
				echo for %%%%i in (0,1,%%len%%^) do if ^^!%%~2[%%%%i]^^! LSS %%max%% set min=^^!%%~2[%%%%i]^^!
				echo (endlocal ^& set %%~1=%%min%%^)
				)>fclib_array_min.bat
				(
				echo set /a len=%%~3-1
				echo set sum=0
				echo setlocal enabledelayedexpansion
				echo for %%%%i in (0,1,%%len%%^) do set /a sum+=^^!%%~2[%%%%i]^^!
				echo (endlocal ^& set %%~1=%%sum%%^)
				)>fclib_array_sum.bat
				(
				echo set res_len=0
				echo :loop
				echo if not defined %%~2[%%res_len%%] (
				echo	set %%~1=%%res_len%%
				echo	exit /b
				echo ^)
				echo set /a res_len+=1
				echo goto :loop
				)>fclib_array_len.bat
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
				echo set mul=1
				echo for /l %%%%i in (1,1,%%~2^) do set /a mul*=%%%%i
				echo set %%~1=%%mul%%
				)>fclib_math_fact.bat
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
				(
				echo setlocal enabledelayedexpansion
				echo set len=0
				echo set str=%%~2
				echo set newstr=
				echo :loop
				echo if not "^!str:^~%%len%%^!" == "" set /a len+=1 ^& goto loop
				echo set /a strlen=%%len%%-1
				echo for /l %%%%i in (%%strlen%%,-1,0^) do set newstr=^^!newstr^^!^^!str:^~%%%%i,1^^!
				echo (endlocal ^& set %%~1=%%newstr%%^)
				)>fclib_string_reverse.bat
				set deniedToken=true
			) else if "!lib!" == "list" (
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
				)>fclib_list_max.bat
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
				)>fclib_list_min.bat
				(
				echo set sum=0
				echo for %%%%i in ^(%%~2^) DO set /a sum+=%%%%i
				echo set %%~1=%%sum%%
				)>fclib_list_sum.bat
				set deniedToken=true
			) else (
				set deniedToken=true
			)
		)
		if %%a == function[] (
			set procval=0
			set procadd=true
			set proctar=!printString:function[] =!
			set deniedToken=true
		)
		if %%a == endfunc[] (
			set procadd=false
			set proctar=none
			set deniedToken=true
		)
		if %%a == reverse_string[] set printString=!printString:reverse_string[]=call fclib_string_reverse.bat!
		if %%a == factorial[] set printString=!printString:factorial[]=call fclib_math_fact.bat!
		if %%a == string_length[] set printString=!printString:string_length[]=call fclib_string_length.bat!
		if %%a == string_upper[] set printString=!printString:string_upper[]=call fclib_string_upper.bat!
		if %%a == string_lower[] set printString=!printString:string_lower[]=call fclib_string_lower.bat!
		if %%a == odd[] set printString=!printString:odd[]=call fclib_math_odd.bat!
		if %%a == even[] set printString=!printString:even[]=call fclib_math_even.bat!
		if %%a == pow[] set printString=!printString:pow[]=call fclib_math_pow.bat!
		if %%a == abs[] set printString=!printString:abs[]=call fclib_math_abs.bat!
		if %%a == max[] set printString=!printString:max[]=call fclib_list_max.bat!
		if %%a == min[] set printString=!printString:min[]=call fclib_list_min.bat!
		if %%a == sum[] set printString=!printString:sum[]=call fclib_list_sum.bat!
		if %%a == arr_max[] set printString=!printString:arr_max[]=call fclib_array_max.bat!
		if %%a == arr_min[] set printString=!printString:arr_min[]=call fclib_array_min.bat!
		if %%a == arr_sum[] set printString=!printString:arr_sum[]=call fclib_array_sum.bat!
		if %%a == arr_length[] set printString=!printString:arr_length[]=call fclib_array_len.bat!
		if %%a == deny[] (
			echo.>%a%.bat
			set deniedToken=true
		)
		if %%a == drive[] set printString=!printString:drive[] =!:
		if %%a == while[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set fccondition=!printString:while[] =!
			echo :WhileLoop!wloopnum!>>!outtar!
			echo if not !fccondition! goto EndLoop!wloopnum!>>!outtar!
			set deniedToken=true
		)
		if %%a == endwhile[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			echo goto WhileLoop!wloopnum!>>!outtar!
			echo :EndLoop!wloopnum!>>!outtar!
			set /a wloopnum=!wloopnum!+1
			set deniedToken=true
		)
		if %%a == repeat[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			echo :repeat!wloopnum!>>!outtar!
			set deniedToken=true
		)
		if %%a == until[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set fccondition2=!printString:until[] =!
			echo if not !fccondition2! goto until!wloopnum2!>>!outtar!
			echo goto repeat!wloopnum2!>>!outtar!
			echo :until!wloopnum2!>>!outtar!
			set /a wloopnum2=!wloopnum2!+1
			set deniedToken=true
		)
		if %%a == key[] set printString=!printString:key[] =CHOICE /C:! /N
		if %%a == uprint[] set printString=!printString:uprint[]=echo!
		if %%a == print[] set printString=!printString:print[] =echo.!
		if %%a == create_dir[] set printString=!printString:create_dir[]=md!
		if %%a == change_dir[] set printString=!printString:change_dir[]=cd!
		if %%a == del[] set printString=!printString:del[]=del!
		if %%a == remove_dir[] set printString=!printString:remove_dir[]=rmdir!
		if %%a == read_file[] set printString=!printString:read_file[]=type!
		if %%a == eq[] (
			set printString=!printString:eq[]=set /a!
			set printString=!printString:++=+=1!
			set printString=!printString:--=-=1!
		)
		if %%a == define[] (
			set !printString:define[]=!
			set deniedToken=true
		)
		if %%a == logoff[] set printString=!printString:logoff[]=SHUTDOWN /l!
		if %%a == hibernate_shutdown[] set printString=!printString:hibernate_shutdown[]=SHUTDOWN /h!
		if %%a == float[] set printString=!printString:float[]=call fclib_float.bat!
		if %%a == var[] set printString=!printString:var[]=set!
		if %%a == inp[] set printString=!printString:inp[]=set /p!
		if %%a == goto[] set printString=!printString:goto[]=goto!
		if %%a == call[] set printString=!printString:call[]=call!
		if %%a == lcall[] set printString=!printString:lcall[] =call :!
		if %%a == change_color[] set printString=!printString:change_color[]=color!
		if %%a == change_mode[] set printString=!printString:change_mode[]=mode!
		if %%a == change_title[] set printString=!printString:change_title[]=title!
		if %%a == rename[] set printString=!printString:rename[]=ren!
		if %%a == mov[] set printString=!printString:mov[]=move!
		if %%a == copy[] set printString=!printString:copy[]=copy!
		if %%a == open[] set printString=!printString:open[]=start!
		if %%a == quit[] set printString=!printString:quit[]=exit!
		if %%a == inf_loop[] set printString=!printString:inf_loop[]=goto FreakCCompiled!
		if %%a == imd_shutdown[] set printString=!printString:imd_shutdown[]=shutdown -s -t 0!
		if %%a == imd_restart[] set printString=!printString:imd_restart[]=shutdown -r -t 0!
		if %%a == clrscr[] set printString=!printString:clrscr[]=cls!
		if %%a == restart_after[] set printString=!printString:restart_after[]=shutdown -r -t!
		if %%a == shutdown_after[] set printString=!printString:shutdown_after[]=shutdown -s -t!
		if %%a == imd_shutdowns[] set printString=!printString:imd_shutdowns[]=SHUTDOWN /p!
		if %%a == stop[] set printString=!printString:stop[]=pause!
		if %%a == local[] set printString=!printString:local[]=SETLOCAL!
		if %%a == endloc[] set printString=!printString:endloc[]=ENDLOCAL!
		if %%a == see_date[] set printString=!printString:see_date[]=date /t!
		if %%a == see_time[] set printString=!printString:see_time[]=time /t!
		if %%a == change_date[] set printString=!printString:change_date[]=date!
		if %%a == change_time[] set printString=!printString:change_time[]=time!
		if %%a == ls[] set printString=!printString:ls[]=dir!
		if %%a == if[] set printString=!printString:if[]=if!
		if %%a == if_el[] set printString=!printString:if_el[]=if errorlevel!
		if %%a == if_not_el[] set printString=!printString:if_not_el[]=if not errorlevel!
		if %%a == if_not[] set printString=!printString:if_not[]=if not!
		if %%a == if_defined[] set printString=!printString:if_defined[]=if defined!
		if %%a == if_exist[] set printString=!printString:if_exist[]=if exist!
		if %%a == if_not_exist[] set printString=!printString:if_not_exist[]=if not exist!
		if %%a == if_not_defined[] set printString=!printString:if_not_defined[]=if not defined!
		if %%a == el[] set printString=!printString:el[]=else!
		if %%a == elif[] set printString=!printString:elif[]=else if!
		if %%a == label[] set printString=!printString:label[] =:!
		if %%a == wait[] set printString=!printString:wait[]=timeout /nobreak /t!
		if %%a == loop[] set printString=!printString:loop[]=for /l!
		if %%a == scan_files[] set printString=!printString:scan_files[]=for /r!
		if %%a == scan_strs[] set printString=!printString:scan_strs[]=for /f!
		if %%a == scan_str[] set printString=!printString:scan_str[]=for!
		if %%a == scan_dir[] set printString=!printString:scan_dir[]=for /d!
		if %%a == ping[] set printString=!printString:ping[]=ping!
		if %%a == sysinf[] set printString=!printString:sysinf[]=systeminfo!
		if %%a == ipinf[] set printString=!printString:ipinf[]=ipconfig /all!
		if %%a == hello_world[] set printString=!printString:hello_world[]=echo Hello, World!
		if %%a == unicode[] set printString=!printString:unicode[]=chcp 65001!
		if %%a == curl[] set printString=!printString:curl[]=curl!
		if %%a == fndstr[] set printString=!printString:ndfstr[]=findstr!
		if %%a == fnd[] set printString=!printString:fnd[]=find!
		if %%a == ps[] set printString=!printString:ps[]=powershell!
		if %%a == enb_delay[] set printString=!printString:enb_delay[]=setlocal enabledelayedexpansion!
	)
	if "!procadd!" == "true" (
		if !procval! == 0 (
			set procval=1
			echo.>!proctar!.bat
		) else (
			if not "!deniedToken!" == "true" echo.!printString!>>!proctar!.bat
		)
	)
	if "!fccomment!" == "false" (
		if not "!procadd!" == "true" if not "!deniedToken!" == "true" echo.!printString!>>%a%.bat
	) else (
		if not "!procadd!" == "true" echo.::!printString!>>%a%.bat
	)
)
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %a%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %a%.bat
exit /b
:fcversion
echo FreakC DevKit Version 0.3.0
exit /b
