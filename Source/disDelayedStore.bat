setlocal disableDelayedExpansion
set name1=%~1
set name2=%~2
type %name1%>%name1:.method=.bat%
type %name1%>%name2:.method=.bat%
exit /b
