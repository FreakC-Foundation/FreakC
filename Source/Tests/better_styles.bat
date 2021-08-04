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
	) else if %~2 == black (
		:: black
		echo [30m%~3[0m
	) else if %~2 == red (
		:: red
		echo [31m%~3[0m
	) else if %~2 == green (
		:: green
		echo [32m%~3[0m
	) else if %~2 == yellow (
		:: yellow
		echo [33m%~3[0m
	) else if %~2 == blue (
		:: blue
		echo [34m%~3[0m
	) else if %~2 == magenta (
		:: magenta
		echo [35m%~3[0m
	) else if %~2 == cyan (
		:: cyan
		echo [36m%~3[0m
	) else if %~2 == white (
		:: white
		echo [37m%~3[0m
	)
) else if %~1 == bg (
	if %~2 == 0 (
		:: black
		echo [40m%~3[0m
	) else if %~2 == 1 (
		:: red
		echo [41m%~3[0m
	) else if %~2 == 2 (
		:: green
		echo [42m%~3[0m
	) else if %~2 == 3 (
		:: yellow
		echo [43m%~3[0m
	) else if %~2 == 4 (
		:: blue
		echo [44m%~3[0m
	) else if %~2 == 5 (
		:: magenta
		echo [45m%~3[0m
	) else if %~2 == 6 (
		:: cyan
		echo [46m%~3[0m
	) else if %~2 == 7 (
		:: white
		echo [47m%~3[0m
	) else if %~2 == black (
		:: black
		echo [40m%~3[0m
	) else if %~2 == red (
		:: red
		echo [41m%~3[0m
	) else if %~2 == green (
		:: green
		echo [42m%~3[0m
	) else if %~2 == yellow (
		:: yellow
		echo [43m%~3[0m
	) else if %~2 == blue (
		:: blue
		echo [44m%~3[0m
	) else if %~2 == magenta (
		:: magenta
		echo [45m%~3[0m
	) else if %~2 == cyan (
		:: cyan
		echo [46m%~3[0m
	) else if %~2 == white (
		:: white
		echo [47m%~3[0m
	)
) else if %~1 == scol (
	if %~2 == 0 (
		:: black
		echo [90m%~3[0m
	) else if %~2 == 1 (
		:: red
		echo [91m%~3[0m
	) else if %~2 == 2 (
		:: green
		echo [92m%~3[0m
	) else if %~2 == 3 (
		:: yellow
		echo [93m%~3[0m
	) else if %~2 == 4 (
		:: blue
		echo [94m%~3[0m
	) else if %~2 == 5 (
		:: magenta
		echo [95m%~3[0m
	) else if %~2 == 6 (
		:: cyan
		echo [96m%~3[0m
	) else if %~2 == 7 (
		:: white
		echo [97m%~3[0m
	) else if %~2 == black (
		:: black
		echo [90m%~3[0m
	) else if %~2 == red (
		:: red
		echo [91m%~3[0m
	) else if %~2 == green (
		:: green
		echo [92m%~3[0m
	) else if %~2 == yellow (
		:: yellow
		echo [93m%~3[0m
	) else if %~2 == blue (
		:: blue
		echo [94m%~3[0m
	) else if %~2 == magenta (
		:: magenta
		echo [95m%~3[0m
	) else if %~2 == cyan (
		:: cyan
		echo [96m%~3[0m
	) else if %~2 == white (
		:: white
		echo [97m%~3[0m
	)
) else if %~1 == sbg (
	if %~2 == 0 (
		:: black
		echo [100m%~3[0m
	) else if %~2 == 1 (
		:: red
		echo [101m%~3[0m
	) else if %~2 == 2 (
		:: green
		echo [102m%~3[0m
	) else if %~2 == 3 (
		:: yellow
		echo [103m%~3[0m
	) else if %~2 == 4 (
		:: blue
		echo [104m%~3[0m
	) else if %~2 == 5 (
		:: magenta
		echo [105m%~3[0m
	) else if %~2 == 6 (
		:: cyan
		echo [106m%~3[0m
	) else if %~2 == 7 (
		:: white
		echo [107m%~3[0m
	) else if %~2 == black (
		:: black
		echo [100m%~3[0m
	) else if %~2 == red (
		:: red
		echo [101m%~3[0m
	) else if %~2 == green (
		:: green
		echo [102m%~3[0m
	) else if %~2 == yellow (
		:: yellow
		echo [103m%~3[0m
	) else if %~2 == blue (
		:: blue
		echo [104m%~3[0m
	) else if %~2 == magenta (
		:: magenta
		echo [105m%~3[0m
	) else if %~2 == cyan (
		:: cyan
		echo [106m%~3[0m
	) else if %~2 == white (
		:: white
		echo [107m%~3[0m
	)
)