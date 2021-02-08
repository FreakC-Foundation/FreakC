@echo off
echo.>tar.fclang
echo. FreakC's interactive shell
echo. ==========================
echo. Version 1.0.0
echo.
echo.
:loop
set /p inp=
if "%inp%" == "StartFuckin[cli]" (
	start freakc tar.fclang
) else if "%inp%" == "StopFuckin[cli]" (
	del /q tar.fclang
	if exist tar.bat (
		del /q tar.bat
	)
	exit /b
) else if "%inp%" == "WipeAss[cli]" (
	echo.>tar.fclang
) else if "%inp%" == "Shit[cli]" (
	cls
) else (
	echo %inp%>>tar.fclang
)
goto loop