@echo off
title Conectando ao HOST
color a
set path="C:\Users\%username%\hst"
set pathfile="C:\Users\%username%\hst\data.ini"
if exist md.ini goto chpath
if not exist %path% goto error1
if not exist %pathfile% goto error2
goto readfile 

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
if not exist %path% goto error1
if not exist %pathfile% goto error2
goto readfile

:error1
title ERR1 - Pasta não Localizada.
cls
echo -------------------------------------------------
echo - Erro! Pasta de Dados não foi encontrada. ERR1 -
echo -------------------------------------------------
echo.
echo.
pause
exit

:error2
title ERR2 - Arquivo não foi Localizado.
cls
echo ---------------------------------------------------
echo - Erro! Arquivo de Dados não foi encontrada. ERR2 -
echo ---------------------------------------------------
echo.
echo.
pause
exit

:readfile
< %pathfile% (
set /p cstatus=
set /p htext=
set /p cname=
)
echo file read. > log.txt
cls
goto wname

:wname
echo -------------------------------------------
echo -            Insira seu Nome              -
echo - Seu nome sera compartilhado com o host. -
echo -------------------------------------------
echo.
echo.
set /p cname=Nome: 
cls
(
echo %cstatus%
echo %htext%
echo %cname%
) > %pathfile%
cls
goto wonline

:wonline
(
echo online
echo %htext%
echo %cname%
) > %pathfile%
cls
goto check

:check
echo %time% %date%
echo -----------------------------------------
echo - Client %cname% esta conectado ao HOST -
echo -----------------------------------------
echo.
echo.
cls
< %pathfile% (
set /p cstatus=
set /p htext=
set /p cname=
)
if %cstatus% == offline goto rtext
if %cstatus% == online goto check

:rtext
echo ---------------------
echo - Mesnagem Recebida -
echo ---------------------
echo.
echo  HOST- %htext%
pause
cls
goto wonline