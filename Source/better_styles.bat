@echo off
if %~1 == col (
	if %~2 == 0 (
		:: black
		echo [30m%~3[0m
	) else if %~2 == 1 (
		:: red
		echo [31m%~3[0m
	) else if %~2 == 2 (
		:: green
		echo [32m%~3[0m
	) else if %~2 == 3 (
		:: yellow
		echo [33m%~3[0m
	) else if %~2 == 4 (
		:: blue
		echo [34m%~3[0m
	) else if %~2 == 5 (
		:: magenta
		echo [35m%~3[0m
	) else if %~2 == 6 (
		:: cyan
		echo [36m%~3[0m
	) else if %~2 == 7 (
		:: white
		echo [37m%~3[0m
	)
)