call :%~1_%~2
exit /b 0
:float_float
echo for /f %%%%i in ('powershell %%~2'^) DO set %%~1=%%%%i>fclib_float.bat
exit /b 0
:array_max
(
echo set /a len=%%~3-1
echo setlocal enabledelayedexpansion
echo set max=^^!%%~2[0]^^!
echo for %%%%i in (0,1,%%len%%^) do if ^^!%%~2[%%%%i]^^! GTR %%max%% set max=^^!%%~2[%%%%i]^^!
echo (endlocal ^& set %%~1=%%max%%^)
)>fclib_array_max.bat
exit /b 0
:array_min
(
echo set /a len=%%~3-1
echo setlocal enabledelayedexpansion
echo set min=^^!%%~2[0]^^!
echo for %%%%i in (0,1,%%len%%^) do if ^^!%%~2[%%%%i]^^! LSS %%min%% set min=^^!%%~2[%%%%i]^^!
echo (endlocal ^& set %%~1=%%min%%^)
)>fclib_array_min.bat
exit /b 0
:array_sum
(
echo set /a len=%%~3-1
echo set sum=0
echo setlocal enabledelayedexpansion
echo for %%%%i in (0,1,%%len%%^) do set /a sum+=^^!%%~2[%%%%i]^^!
echo (endlocal ^& set %%~1=%%sum%%^)
)>fclib_array_sum.bat
exit /b 0
:array_join
(
echo set /a len=%%~3-1
echo setlocal enabledelayedexpansion
echo for %%%%i in (0,1,%%len%%^) do set res=^^!res^^!^^!%%~2[%%%%i]^^!
echo (endlocal ^& set %%~1=%%res%%^)
)>fclib_array_join.bat
exit /b 0
:array_len
(
echo set res_len=0
echo :loop
echo if not defined %%~2[%%res_len%%] (
echo 	set %%~1=%%res_len%%
echo 	exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_len.bat
exit /b 0
:array_includes
(
echo set res_len=0
echo setlocal enabledelayedexpansion
echo :loop
echo if "^!%%~3[%%res_len%%]^!" == "%%~2" (
echo    endlocal ^& set %%~1=true
echo    exit /b
echo ^) else if %%res_len%% GEQ %%~4 (
echo    endlocal ^& set %%~1=false
echo    exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_includes.bat
exit /b
:array_indexOf
(
    exit /b 0
echo set res_len=0
echo setlocal enabledelayedexpansion
echo :loop
echo if "^!%%~3[%%res_len%%]^!" == "%%~2" (
echo 	endlocal ^& set %%~1=%%res_len%%
echo 	exit /b
echo ^) else if %%res_len%% GEQ %%~4 (
echo 	endlocal ^& set %%~1=-1
echo 	exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_indexOf.bat
exit /b 0
:array_lastIndexOf
(
echo set /a res_len=%%~4-1
echo setlocal enabledelayedexpansion
echo :loop
echo if "^!%%~3[%%res_len%%]^!" == "%%~2" (
echo 	endlocal ^& set %%~1=%%res_len%%
echo 	exit /b
echo ^) else if %%res_len%% LEQ 0 (
echo 	endlocal ^& set %%~1=-1
echo 	exit /b
echo ^)
echo set /a res_len-=1
echo goto :loop
)>fclib_array_lastIndexOf.bat
exit /b 0
:array_push
(
echo set res_len=0
echo :loop
echo if not defined %%~1[%%res_len%%] (
echo    set %%~1[%%res_len%%]=%%~2
echo    exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_push.bat
exit /b
:array_pop
(
echo set res_len=0
echo :loop
echo if not defined %%~1[%%res_len%%] goto end
echo set /a res_len+=1
echo goto :loop
echo :end
echo set /a res_len-=1
echo set %%~1[%%res_len%%]^=
)>fclib_array_pop.bat
exit /b
:array_shift
(
echo call :length len %%~1
echo for /l %%%%i in (0 1 ^^!len^^!^) do (
echo     set /a ind=%%%%i+1
echo     for %%%%j in (^^!ind^^!^) do set %%~1[%%%%i]=^^!%%~1[%%%%j]^^!
echo ^)
echo exit /b
echo :length
echo set res_len=0
echo :loop
echo if not defined %%~2[%%res_len%%] (
echo     set %%~1=%%res_len%%
echo     exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_shift.bat
:array_unshift
(
echo call :length len %%~1
echo for /l %%%%i in (1 1 ^^!len^^!^) do (
echo     set /a ind=%%%%i-1
echo     for %%%%j in (^^!ind^^!^) do set _arr[%%%%i]=^^!%%~1[%%%%j]^^!
echo ^)
echo for /l %%%%i in (1 1 ^^!len^^!^) do set %%~1[%%%%i]=^^!_arr[%%%%i]^^!
echo set %%~1[0]=%%~2
echo exit /b
echo :length
echo set res_len=0
echo :loop
echo if not defined %%~2[%%res_len%%] (
echo     set %%~1=%%res_len%%
echo     exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop
)>fclib_array_unshift.bat
exit /b
:array_clear
(
echo set ind=0
echo :loop
echo if defined %%~1[%%ind%%] (
echo     set %%~1[%%ind%%]=
echo ^) else exit /b
echo set /a ind+=1
echo goto loop
)>fclib_array_clear.bat
exit /b
:math_abs
(
echo set tar=%%~2
echo set %%~1=%%tar:-=%%
)>fclib_math_abs.bat
exit /b 0
:math_even
(
echo set /a res=%%~2 %%%% 2
echo if %%res%% == 0 (
echo 	set %%~1=true
echo ^) else (
echo 	set %%~1=false
echo ^)
)>fclib_math_even.bat
exit /b 0
:math_odd
(
echo set /a res=%%~2 %%%% 2
echo if %%res%% == 0 (
echo 	set %%~1=false
echo ^) else (
echo 	set %%~1=true
echo ^)
)>fclib_math_odd.bat
exit /b 0
:math_pow
(
echo set res=%%~2
echo set /a t=%%~3 - 1
echo for /l %%%%i in (1,1,%%t%%^) do (
echo 	set /a res*=%%res%%
echo ^)
echo set %%~1=%%res%%
)>fclib_math_pow.bat
exit /b 0
:math_fact
(
echo set mul=1
echo for /l %%%%i in (1,1,%%~2^) do set /a mul*=%%%%i
echo set %%~1=%%mul%%
)>fclib_math_fact.bat
exit /b 0
:string_lower
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
exit /b 0
:string_upper
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
exit /b 0
:string_slice
(
echo set /a len=%%~4-%%~3
echo set str=%%~2
echo setlocal enabledelayedexpansion
echo set str=^^!str:~%%~3,%%len%%^^!
echo endlocal ^& set %%~1=%%str%%
)>fclib_string_slice.bat
exit /b 0
:string_length
(
echo setlocal enabledelayedexpansion
echo set len=0
echo set str=%%~2
echo :loop
echo if not "^!str:^~%%len%%^!" == "" set /a len+=1 ^& goto loop
echo (endlocal ^& set %%~1=%%len%%^)
)>fclib_string_length.bat
exit /b 0
:string_reverse
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
exit /b 0
:string_chr
(
echo if "%%~2" == "" exit /b
echo if %%~2 LSS 32 exit /b
echo if %%~2 GTR 126 exit /b
echo set alphabet= ^^!"#$%%%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
echo setlocal enabledelayedexpansion
echo set /a var=%%~2-32
echo set char=^^!alphabet:~%%var%%,1^^!
echo endlocal ^& set %%~1=^^%%char%%
)>fclib_string_chr.bat
exit /b 0
:string_ord
(
echo setlocal enabledelayedexpansion
echo set target=%%~2
echo set alphabet= ^^^^^^^^^^!"#$%%%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
echo for /l %%%%i in (0,1,94^) do if "^!alphabet:~%%%%i,1^!" == "^!target:~0,1^!" set /a res=%%%%i+32
echo endlocal ^& set %%~1=%%res%%
)>fclib_string_ord.bat
exit /b 0
:string_startwith
(
echo set str=%%~2
echo call :length "len" "%%~3"
echo setlocal enabledelayedexpansion
echo if "^!str:~%%~4,%%len%%^!" == "%%~3" (
echo 	(endlocal ^& set %%~1=true^)
echo ^) else (
echo 	(endlocal ^& set %%~1=false^)
echo ^)
echo exit /b
echo :length
echo setlocal enabledelayedexpansion
echo set len=0
echo set str=%%~2
echo :loop
echo if not "^!str:~%%len%%^!" == "" set /a len+=1 ^& goto loop
echo (endlocal ^& set %%~1=%%len%%^)
echo exit /b
)>fclib_string_startwith.bat
exit /b
:string_endwith
(
echo set str=%%~2
echo call :length "len" "%%~3"
echo setlocal enabledelayedexpansion
echo set str=^^!str:~0,19^^!
echo if "^!str:~-%%len%%^!" == "%%~3" (
echo 	(endlocal ^& set %%~1=true^)
echo ^) else (
echo 	(endlocal ^& set %%~1=false^)
echo ^)
echo exit /b
echo :length
echo setlocal enabledelayedexpansion
echo set len=0
echo set str=%%~2
echo :loop
echo if not "^!str:~%%len%%^!" == "" set /a len+=1 ^& goto loop
echo (endlocal ^& set %%~1=%%len%%^)
exit /b
)>fclib_string_endwith.bat
exit /b
:string_indexOf
(
echo set res_len=0
echo set str=%%~3
echo call :length sublen "%%~2"
echo call :length strlen "%%~3"
echo setlocal enabledelayedexpansion
echo :loop1
echo set /a res_len1=%%res_len%% - %%sublen%%
echo if "^!str:~%%res_len%%,%%sublen%%^!" == "%%~2" (
echo 	endlocal ^& set %%~1=%%res_len%%
echo 	exit /b
echo ^) else if %%res_len1%% GEQ %%strlen%% (
echo 	endlocal ^& set %%~1=-1
echo 	exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop1
echo :length
echo setlocal enabledelayedexpansion
echo set len=0
echo set str=%%~2
echo :loop
echo if not "^!str:~%%len%%^!" == "" set /a len+=1 ^& goto loop
echo (endlocal ^& set %%~1=%%len%%^)
echo exit /b
)>fclib_string_indexOf.bat
:string_lastIndexOf
(
echo set str=%%~3
echo call :length sublen "%%~2"
echo call :length strlen "%%~3"
echo set /a res_len=%%strlen%% - %%sublen%%
echo setlocal enabledelayedexpansion
echo :loop1
echo if "^!str:~%%res_len%%,%%sublen%%^!" == "%%~2" (
echo 	endlocal ^& set %%~1=%%res_len%%
echo 	exit /b
echo ^) else if %%res_len%% LSS 0 (
echo 	endlocal ^& set %%~1=-1
echo 	exit /b
echo ^)
echo set /a res_len+=1
echo goto :loop1
echo :length
echo setlocal enabledelayedexpansion
echo set len=0
echo set str=%%~2
echo :loop
echo if not "^!str:~%%len%%^!" == "" set /a len+=1 ^& goto loop
echo (endlocal ^& set %%~1=%%len%%^)
echo exit /b
)>fclib_string_lastIndexOf.bat
exit /b
:string_trim
(
echo setlocal enabledelayedexpansion
echo set str=%%~2
echo :loop
echo set check=false
echo if "^!str:~0,1^!" == "	" set check=true
echo if "^!str:~0,1^!" == " " set check=true
echo if "^!check^!" == "true" (
echo 	set str=^^!str:~1^^!
echo 	goto loop
echo ^)
echo :loop2
echo set check=false
 echo if "^!str:~-1^!" == "	" set check=true
echo if "^!str:~-1^!" == " " set check=true
echo if "^!check^!" == "true" (
echo 	set str=^^!str:~0,-1^^!
echo 	goto loop2
echo ^)
echo (endlocal ^& set %%~1=%%str%%^)
echo exit /b
)>fclib_string_trim.bat
exit /b
:list_max
(
echo set max=1
echo for %%%%i in ^(%%~2^) do (
echo 	set max=%%%%i
echo 	goto fcmaxend
echo ^)
echo :fcmaxend
echo for %%%%i in (%%~2^) do if %%%%i GTR %%max%% set max=%%%%i
echo set %%~1=%%max%%
)>fclib_list_max.bat
exit /b 0
:list_min
(
echo set min=1
echo for %%%%i in ^(%%~2^) do (
echo 	set min=%%%%i
echo 	goto fcminend
echo ^)
echo :fcminend
echo for %%%%i in (%%~2^) do if %%%%i LSS %%min%% set min=%%%%i
echo set %%~1=%%min%%
)>fclib_list_min.bat
exit /b 0
:list_sum
(
echo set sum=0
echo for %%%%i in ^(%%~2^) do set /a sum+=%%%%i
echo set %%~1=%%sum%%
)>fclib_list_sum.bat
exit /b 0
:util_cnd
echo if %%~2 (set %%~1=%%~3^) else set %%~1=%%~4>fclib_util_cnd.bat
exit /b 0