@echo off
echo.>tar.fclang
echo. FreakC's interactive shell
echo. ==========================
echo. Version 0.1.0
echo.
echo.
:loop
set /p inp=
if "%inp%" == "start[]" (
	start freakc tar.fclang
) else if "%inp%" == "endcli[]" (
	del /q tar.fclang
	if exist tar.bat (
		del /q tar.bat
	)
	exit /b
) else if "%inp%" == "wipe[]" (
	echo.>tar.fclang
) else if "%inp%" == "clr[]" (
	cls
) else (
	echo %inp%>>tar.fclang
)
goto loop