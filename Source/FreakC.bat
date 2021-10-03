@echo off
setlocal enabledelayedexpansion
set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%
set LF=^^%NL%
set helpCheck=false
if "%1" == "" (
	set helpCheck=true
	set pauseAcp=true
)
if "%1" == "--help" set helpCheck=true
if "%helpCheck%" == "true" (
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
	if "%pauseAcp%" == "true" pause >nul
	exit /b
)
if "%1" == "--version" goto fcversion
if "%2" == "--compile" set fccompile=true
if "%2" == "--candr" set fcread=true
if "%2" == "--create" set fccreate=true
if "%1" == "--shell" (
	FCShell
	exit /b
)
if "%1" == "--clrlib" (
	for /r %%i in (*.bat) do (
		set name=%%i
		if "!name:fclib=!" NEQ "!name!" del /q %%i
	)
	exit /b
)
if "%1" == "--clrbat" (
	for /r %%i in (*.bat) do (
		set name=%%i
		set clearCheck=false
		if "!name:FreakC.bat=!" NEQ "!name!" set clearCheck=true
		if "!name:FCShell.bat=!" NEQ "!name!" set clearCheck=true
		if "!name:createFile.bat=!" NEQ "!name!" set clearCheck=true
		if "!name:libgen.bat=!" NEQ "!name!" set clearCheck=true
		if "!name:disDelayedStore.bat=!" NEQ "!name!" set clearCheck=true
		if "!clearCheck!" == "false" del /q %%i
	)
	exit /b
)
set fccompilename=%1
set output=%fccompilename:.fclang=%
if "%fccreate%" == "true" (
	md %output%
	cd %output%
	if "%3" == "--empty" (
		if "%4" == "--de-enabled" echo enb_delay[]>%output%.fclang
		echo.>>%output%.fclang
	) else (
		if "%3" == "--de-enabled" echo enb_delay[]>%output%.fclang
		echo print[] Hello World, Hello FreakC^^!>>%output%.fclang
	)
	exit /b
)
set fccomment=false
set wloopnum=0
set wloopnum2=0
set proctar=something
set inlftar=something
set classtar=something
set methodtar=something
set fchcomment=false
set matchInd=0
set forInd=0
set wloopInd=0
set wloopInd2=0
set prevLoopInd=0
echo @echo off>%output%.bat
if "%2" == "--de-enabled" echo setlocal enabledelayedexpansion>>%output%.bat
if "%3" == "--de-enabled" echo setlocal enabledelayedexpansion>>%output%.bat
echo :FreakCCompiled>>%output%.bat
for /f "tokens=* delims=	 " %%x in ('type %output%.fclang') do (
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
		if "%%a" == "h[]" set deniedToken=true
		if "%%a" == "ch[]" set fchcomment=true
		if "%%a" == "ce[]" (
			set fchcomment=false
			set deniedToken=true
		)
		if %%a == include[] (
			set targetFile=!printString:include[] =!
			if exist !targetFile!.fclang (
				call createFile.bat "!targetFile!"
				type !targetFile!.bat>>%output%.bat
			)
			set deniedToken=true
		)
		if %%a == compile[] (
			set targetFile=!printString:compile[] =!
			if exist !targetFile!.fclang call createFile.bat "!targetFile!"
			set deniedToken=true
		)
		if %%a == end[] set printString=!printString:end[]=exit /b 0!
		if %%a == gen_lib_func[] (
			call libgen !printString:gen_lib_func[] =!
			set deniedToken=true
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
		if %%a == inlinef[] (
			set inlfval=0
			set inlfadd=true
			set inlftar=!printString:inlinef[] =!
			set deniedToken=true
		)
		if %%a == endinlf[] (
			set inlfadd=false
			set inlftar=none
			set deniedToken=true
		)
		if %%a == class[] (
			set classval=0
			set classadd=true
			set classtar=!printString:class[] =!
			set deniedToken=true
		)
		if %%a == endclass[] (
			set classadd=false
			set classtar=none
			set deniedToken=true
		)
		if %%a == method[] (
			set methodval=0
			set methodadd=true
			set methodtar=!printString:method[] =!
			set deniedToken=true
		)
		if %%a == endmethod[] (
			set methodadd=false
			set methodtar=none
			set deniedToken=true
		)
		if %%a == new[] (
			set cprocess=!printString:new[] =!
			set turn=0
			for %%i in (!cprocess!) do (
				if !turn! == 0 set target=%%i
				if !turn! == 1 set objname=%%i
				set /a turn+=1
			)
			for /r %%i in (*.method) do (
				set name=%%i
				set name=!name:%cd%\=!
				set _name=!name:.method=.bat!
				call :get_len len !target!
				for %%j in (!len!) do if "!name:~0,%%j!" == "!target!" ( 
					for /f "delims=" %%n in ('find /c /v "" !name!') do set "slen=%%n"
					set "slen=!slen:*: =!"
					echo.>!objname!!_name:~%%j!
					<"!name!" (
						for /L %%c in (1 1 !slen!) do (
							set /p line=
							if "!line!" NEQ "" for %%v in (!objname!) do (
								if "!line:$this=!" NEQ "!line!" (
									echo !line:$this=%%v!>>!objname!!_name:~%%j!
								) else echo !line!>>!objname!!_name:~%%j!
							)
						)
					)
				)
				set line=
			)
			if exist !objname!.init.bat (
				for %%i in (!target!) do for %%j in (!objname!) do set printString=!printString:new[] %%i =call %%j.init.bat !
			) else set deniedToken=true
		)
		if %%a == extends[] (
			set target=!printString:extends[] =!
			for /r %%i in (*.method) do (
				set name=%%i
				set name=!name:%cd%\=!
				call :get_len len !target!
				for %%j in (!len!) do if "!name:~0,%%j!" == "!target!" ( 
					for /f "delims=" %%n in ('find /c /v "" !name!') do set "slen=%%n"
					set "slen=!slen:*: =!"
					<"!name!" (
						for /L %%c in (1 1 !slen!) do (
							set /p line=
							if "!line!" NEQ "" for %%v in (!classtar!) do echo !line!>>!classtar!!name:~%%j!
						)
					)
				)
				set line=
			)
			set deniedToken=true
		)
		set icall=false
		if "!ch:~-4!" == "[//]" (
			set icall=true
			set iprocess=!printString:[//]=!
		)
		if %%a == icall[] (
			set icall=true
			set iprocess=!printString:icall[] =!
		)
		if "!icall!" == "true" (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set deniedToken=true
			set turn=0
			for %%i in (!iprocess!) do (
				if !turn! LEQ 0 (
					set inltar=%%i
				) else set inlargs[!turn!]=%%i
				set /a turn+=1
			)
			set /a turn-=1
			for /f "delims=" %%n in ('find /c /v "" !inltar!.inline') do set "len=%%n"
			set "len=!len:*: =!"
			<"!inltar!.inline" (
				for /L %%c in (1 1 !len!) do (
					set /p line=
					if !turn! == 0 (
						echo.!line!>>!outtar!
					) else (
						for /l %%z in (1 1 !turn!) do for %%v in (!inlargs[%%z]!) do if %%c GEQ 2 set line=!line:%%z[]=%%v!
						echo.!line!>>!outtar!
					)
				)
			)
		)
		if %%a == string_reverse[] (
			call libgen string reverse
			set printString=!printString:string_reverse[]=call fclib_string_reverse.bat!
		)
		if %%a == string_length[] (
			call libgen string length
			set printString=!printString:string_length[]=call fclib_string_length.bat!
		)
		if %%a == string_slice[] (
			call libgen string slice
			set printString=!printString:string_slice[]=call fclib_string_slice.bat!
		)
		if %%a == string_upper[] (
			call libgen string upper
			set printString=!printString:string_upper[]=call fclib_string_upper.bat!
		)
		if %%a == string_lower[] (
			call libgen string lower
			set printString=!printString:string_lower[]=call fclib_string_lower.bat!
		)
		if %%a == string_chr[] (
			call libgen string chr
			set printString=!printString:string_chr[]=call fclib_string_chr.bat!
		)
		if %%a == string_ord[] (
			call libgen string ord
			set printString=!printString:string_ord[]=call fclib_string_ord.bat!
		)
		if %%a == string_indexOf[] (
			call libgen string indexOf
			set printString=!printString:string_indexOf[]=call fclib_string_indexOf.bat!
		)
		if %%a == string_lastIndexOf[] (
			call libgen string lastIndexOf
			set printString=!printString:string_lastIndexOf[]=call fclib_string_lastIndexOf.bat!
		)
		if %%a == string_trim[] (
			call libgen string trim
			set printString=!printString:string_trim[]=call fclib_string_trim.bat!
		)
		if %%a == string_startswith[] (
			call libgen string startwith
			set printString=!printString:string_startswith[]=call fclib_string_startwith.bat!
		)
		if %%a == string_endswith[] (
			call libgen string endwith
			set printString=!printString:string_endswith[]=call fclib_string_endwith.bat!
		)
		if %%a == factorial[] (
			call libgen math fact
			set printString=!printString:factorial[]=call fclib_math_fact.bat!
		)
		if %%a == odd[] (
			call libgen math odd
			set printString=!printString:odd[]=call fclib_math_odd.bat!
		)
		if %%a == even[] (
			call libgen math even
			set printString=!printString:even[]=call fclib_math_even.bat!
		)
		if %%a == pow[] (
			call libgen math pow
			set printString=!printString:pow[]=call fclib_math_pow.bat!
		)
		if %%a == abs[] (
			call libgen math abs
			set printString=!printString:abs[]=call fclib_math_abs.bat!
		)
		if %%a == max[] (
			call libgen list max
			set printString=!printString:max[]=call fclib_list_max.bat!
		)
		if %%a == min[] (
			call libgen list min
			set printString=!printString:min[]=call fclib_list_min.bat!
		)
		if %%a == sum[] (
			call libgen list sum
			set printString=!printString:sum[]=call fclib_list_sum.bat!
		)
		if %%a == arr_qsort[] (
			call libgen array qsort
			set printString=!printString:arr_qsort[]=call fclib_array_qsort.bat!
		)
		if %%a == arr_max[] (
			call libgen array max
			set printString=!printString:arr_max[]=call fclib_array_max.bat!
		)
		if %%a == arr_min[] (
			call libgen array min
			set printString=!printString:arr_min[]=call fclib_array_min.bat!
		)
		if %%a == arr_sum[] (
			call libgen array sum
			set printString=!printString:arr_sum[]=call fclib_array_sum.bat!
		)
		if %%a == arr_join[] (
			call libgen array join
			set printString=!printString:arr_join[]=call fclib_array_join.bat!
		)
		if %%a == arr_push[] (
			call libgen array push
			set printString=!printString:arr_push[]=call fclib_array_push.bat!
		)
		if %%a == arr_pop[] (
			call libgen array pop
			set printString=!printString:arr_pop[]=call fclib_array_pop.bat!
		)
		if %%a == arr_shift[] (
			call libgen array shift
			set printString=!printString:arr_shift[]=call fclib_array_shift.bat!
		)
		if %%a == arr_unshift[] (
			call libgen array unshift
			set printString=!printString:arr_unshift[]=call fclib_array_unshift.bat!
		)
		if %%a == arr_clear[] (
			call libgen array clear
			set printString=!printString:arr_clear[]=call fclib_array_clear.bat!
		)
		if %%a == arr_fill[] (
			call libgen array fill
			set printString=!printString:arr_fill[]=call fclib_array_fill.bat!
		)
		if %%a == arr_splice[] (
			call libgen array splice
			set printString=!printString:arr_splice[]=call fclib_array_splice.bat!
		)
		if %%a == arr_reverse[] (
			call libgen array reverse
			set printString=!printString:arr_reverse[]=call fclib_array_reverse.bat!
		)
		if %%a == arr_length[] (
			call libgen array len
			set printString=!printString:arr_length[]=call fclib_array_len.bat!
		)
		if %%a == arr_indexOf[] (
			call libgen array indexOf
			set printString=!printString:arr_indexOf[]=call fclib_array_indexOf.bat!
		)
		if %%a == arr_includes[] (
			call libgen array includes
			set printString=!printString:arr_includes[]=call fclib_array_includes.bat!
		)
		if %%a == arr_lastIndexOf[] (
			call libgen array lastIndexOf
			set printString=!printString:arr_lastIndexOf[]=call fclib_array_lastIndexOf.bat!
		)
		if %%a == deny[] (
			echo.>%output%.bat
			set deniedToken=true
		)
		if %%a == drive[] set printString=!printString:drive[] =!:
		if %%a == while[] (
			set prevLoop[!prevLoopInd!]=while
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set fccondition=!printString:while[] =!
			set fcpos[!wloopInd!]=!wloopnum!
			for %%i in (!wloopInd!) do (
				echo :WhileLoop!fcpos[%%i]!>>!outtar!
				echo if not !fccondition! goto EndLoop!fcpos[%%i]!>>!outtar!
			)
			set /a wloopnum+=1
			set /a wloopInd+=1
			set /a prevLoopInd+=1
			set deniedToken=true
		)
		if %%a == for[] (
			set prevLoop[!prevLoopInd!]=for
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set turn=0
			set process=!printString:for[] =!
			for %%i in (!process!) do (
				if !turn! == 0 set varname[!forInd!]=%%i
				if !turn! == 1 set start[!forInd!]=%%i
				if !turn! == 2 set step[!forInd!]=%%i
				if !turn! == 3 set end[!forInd!]=%%i
				set /a turn+=1
			)
			set fcpos[!wloopInd!]=!wloopnum!
			for %%i in (!wloopInd!) do (
				for %%s in (!forInd!) do echo set !varname[%%s]!=!start[%%s]!>>!outtar!
				for %%s in (!forInd!) do echo :WhileLoop!fcpos[%%i]!>>!outtar!
				for %%s in (!forInd!) do echo if ^^!!varname[%%s]!^^! GEQ !end[%%s]! goto EndLoop!fcpos[%%i]!>>!outtar!
			)
			set /a wloopnum+=1
			set /a wloopInd+=1
			set /a forInd+=1
			set /a prevLoopInd+=1
			set deniedToken=true
		)
		set whileCheck=false
		set acceptFor=false
		if %%a == endfor[] (
			set whileCheck=true
			set acceptFor=true
		)
		if %%a == endwhile[] set whileCheck=true
		if "!whileCheck!" == "true" (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set /a _wloopInd=!wloopInd!-1
			for %%i in (!_wloopInd!) do (
				if "!acceptFor!" == "true" (
					set /a forInd-=1
					for %%s in (!forInd!) do echo set /a !varname[%%s]!+=!step[%%s]!>>!outtar!
				)
				echo goto WhileLoop!fcpos[%%i]!>>!outtar!
				echo :EndLoop!fcpos[%%i]!>>!outtar!
			)
			set /a wloopInd-=1
			set deniedToken=true
		)
		if %%a == breakl[] (
			set /a _wloopInd=!wloopInd!-1
			set /a _wloopInd2=!wloopInd2!-1
			set /a prevLoopInd-=1
			for %%i in (!prevLoopInd!) do (
				if "!prevLoop[%%i]!" == "for" for %%y in (!_wloopInd!) do for %%s in (!fcpos[%%y]!) do set printString=!printString:breakl[]=goto EndLoop%%s!
				if "!prevLoop[%%i]!" == "while" for %%y in (!_wloopInd!) do for %%s in (!fcpos[%%y]!) do set printString=!printString:breakl[]=goto EndLoop%%s!
				if "!prevLoop[%%i]!" == "repeat" for %%y in (!_wloopInd2!) do for %%s in (!fcpos2[%%y]!) do set printString=!printString:breakl[]=goto UntilLoop%%s!
			)
		)
		if %%a == continue[] (
			set /a _forInd=!forInd!-1
			set /a _wloopInd=!wloopInd!-1
			set /a _wloopInd2=!wloopInd2!-1
			set /a prevLoopInd-=1
			for %%i in (!prevLoopInd!) do (
				if "!prevLoop[%%i]!" == "for" for %%y in (!_wloopInd!) do for %%s in (!fcpos[%%y]!) do for %%k in (!_forInd!) do for %%q in (!varname[%%k]!) do for %%z in (!step[%%k]!) do set printString=!printString:continue[]=set /a %%q+=%%z ^& goto WhileLoop%%s!
				if "!prevLoop[%%i]!" == "while" for %%y in (!_wloopInd!) do for %%s in (!fcpos[%%y]!) do set printString=!printString:continue[]=goto WhileLoop%%s!
				if "!prevLoop[%%i]!" == "repeat" for %%y in (!_wloopInd2!) do for %%s in (!fcpos2[%%y]!) do set printString=!printString:continue[]=goto RepeatLoop%%s!
			)
		)
		if %%a == repeat[] (
			set prevLoop[!prevLoopInd!]=repeat
			set prevLoop=repeat
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set fcpos2[!wloopInd2!]=!wloopnum2!
			for %%i in (!wloopInd2!) do echo :RepeatLoop!fcpos2[%%i]!>>!outtar!
			set /a wloopnum2+=1
			set /a prevLoopInd+=1
			set /a wloopInd2+=1
			set deniedToken=true
		)
		if %%a == until[] (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set /a _wloopInd2=!wloopInd2!-1
			set fccondition2=!printString:until[] =!
			for %%i in (!_wloopInd2!) do (
				echo if !fccondition2! goto UntilLoop!fcpos2[%%i]!>>!outtar!
				echo goto RepeatLoop!fcpos2[%%i]!>>!outtar!
				echo :UntilLoop!fcpos2[%%i]!>>!outtar!
			)
			set /a wloopInd2-=1
			set deniedToken=true
		)
		if %%a == begin[] set printString=!printString:begin[]=(!
		if %%a == done[] set printString=!printString:done[]=^)!
		if %%a == match[] (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set matchConds[!matchInd!]=!printString:match[] =!
			echo set matchChecked!matchInd!=false>>!outtar!
			set /a matchInd+=1
			set deniedToken=true
		)
		if %%a == case[] (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set /a _matchInd=!matchInd!-1
			for %%i in (!_matchInd!) do (
				(
				echo if !matchConds[%%i]! == !printString:case[] =! (
				echo set matchChecked%%i=true
				)>>!outtar!
			)
			set deniedToken=true
		)
		if %%a == default[] (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			set /a _matchInd=!matchInd!-1
			for %%i in (!_matchInd!) do echo if "^!matchChecked%%i^!" == "false" (>>!outtar!
			set deniedToken=true
		)
		if %%a == endcase[] (
			if "!procadd!" == "true" (set outtar=!proctar!.bat) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else if "!inlfadd!" == "true" (set outtar=!inlftar!.inline) else (set outtar=%output%.bat)
			echo ^)>>!outtar!
			set deniedToken=true
		)
		if %%a == endmatch[] (
			set deniedToken=true
			set /a matchInd-=1
		)
		if %%a == key[] set printString=!printString:key[] =CHOICE /C:! /N
		if %%a == uprint[] set printString=!printString:uprint[]=echo!
		if %%a == print[] set printString=!printString:print[] =echo.!
		if %%a == fprint[] set printString=!printString:fprint[] =echo:!
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
		if %%a == float[] (
			call libgen float float
			set printString=!printString:float[]=call fclib_float.bat!
		)
		if %%a == var[] set printString=!printString:var[]=set!
		if %%a == cnd[] (
			call libgen util cnd
			set printString=!printString:cnd[]=call fclib_util_cnd.bat!
		)
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
		if %%a == dis_delay[] set printString=!printString:dis_delay[]=setlocal disabledelayedexpansion!
	)
	if not "!fchcomment!" == "true" (
		if "!procadd!" == "true" (
			if !procval! == 0 (
				set procval=1
				echo.>!proctar!.bat
			) else (
				if "!fccomment!" == "true" (
					echo.::!printString!>>!proctar!.bat
				) else if not "!deniedToken!" == "true" (
					echo.!printString!>>!proctar!.bat
				)
			)
		) else if "!inlfadd!" == "true" (
			if !inlfval! == 0 (
				set inlfval=1
				echo.>!inlftar!.inline
			) else (
				if "!fccomment!" == "true" (
					echo.::!printString!>>!inlftar!.inline
				) else if not "!deniedToken!" == "true" (
					echo.!printString!>>!inlftar!.inline
				)
			)
		) else if "!methodadd!" == "true" (
			if !methodval! == 0 (
				set methodval=1
			) else (
				if "!fccomment!" == "true" (
					echo.::!printString!>>!classtar!.!methodtar!.method
				) else if not "!deniedToken!" == "true" (
					echo.!printString!>>!classtar!.!methodtar!.method
				)
			)
		) else (
			if "!fccomment!" == "true" (
				echo.::!printString!>>%output%.bat
			) else if not "!deniedToken!" == "true" (
				echo.!printString!>>%output%.bat
			)
		)
	)
)
if exist *.inline del /q *.inline
if exist *.method del /q *.method
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %output%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %output%.bat
exit /b
:fcversion
echo FreakC DevKit Version 0.18.0 BETA
exit /b

:get_len
set len=0
set str=%~2
:loop
if not "!str:~%len%!" == "" set /a len+=1 & goto loop
(endlocal & set %~1=%len%)
exit /b
