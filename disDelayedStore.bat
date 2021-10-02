setlocal disableDelayedExpansion
set name=%~2
type %~1>%name:.method=.bat%
exit /b
