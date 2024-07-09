@echo off
title Starting HOST...
color a
set path="C:\Users\%username%\hst"
set pathfile="C:\Users\%username%\hst\data.ini"
if exist md.ini goto chpath
if exist %path% goto rmdata
goto mkdata

:chpath
< md.ini (
set /p pathfile=
set /p path=
)
set pathfile="%pathfile%"
set path="%path%"
cls
echo -NEW PATH:%path%
echo -NEW PATHFILE:%pathfile%
echo.
pause
cls
if exist %path% goto rmdata
goto mkdata

:rmdata
title Removing Data...
rd /s /q %path%
cls
goto mkdata

:mkdata
title Making Data...
mkdir %path%
(
echo offline
echo none
echo none
) > %pathfile%
cls
goto chforcli

:chforcli
title Waiting for Client...
cls
echo Time:%time% Date:%date%
echo ---------------------------------
echo - Waiting for Client to Connect -
echo ---------------------------------
echo.
echo.
< %pathfile% (
set /p cstatus=
set /p htext=
set /p cname=
)
if %cstatus% == online goto wconnected
goto chforcli

:wconnected
title Client:%cname% connected to HOST
cls
echo. 
echo - Client: %cname% Connected. -
echo. 
echo.
pause
cls
goto wtext

:wtext
title Send the Message to Client:%cname%
cls
echo -------------------------------
echo - Send you Message to Client. -
echo -------------------------------
echo Client name:%cname%
echo.
echo.
set /p htext=Message:
(
echo offline
echo %htext%
echo %cname%
) > %pathfile%
cls
goto checkfread

:checkfread
title Waiting for Client:%cname% to read Message.
cls
echo ---------------------------------------
echo - Waiting for Client to Read Message. -
echo ---------------------------------------
echo Client Connected:%cname%
echo.
echo.
< %pathfile% (
set /p cstatus=
set /p htext=
set /p cname=
)
if %cstatus% == online goto wtext
goto checkfread