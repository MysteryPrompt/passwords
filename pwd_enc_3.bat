@echo off
title Enter password
color 0f
mode con cols=45 lines=2
cls
goto prog_start

:prog_start
cls
::use the variable below to set the
::password length
set pwd_lngth=18

set /a no_access=0
set /a fail_limit=5

:reset
set pwd=
set prompt=Enter password: 
set prompt_char=0
set hide=
set hide_char=*
set counter=0
goto prompt_loop

:prompt_loop
choice /c:abcdefghijklmnopqrstuvwxyz0123456789 /n /m "%prompt%%hide%"
if errorlevel 37 set letter=37&goto concatenation
if errorlevel 36 set letter=36&goto concatenation
if errorlevel 35 set letter=35&goto concatenation
if errorlevel 34 set letter=34&goto concatenation
if errorlevel 33 set letter=33&goto concatenation
if errorlevel 32 set letter=32&goto concatenation
if errorlevel 31 set letter=31&goto concatenation
if errorlevel 30 set letter=30&goto concatenation
if errorlevel 29 set letter=29&goto concatenation
if errorlevel 28 set letter=28&goto concatenation
if errorlevel 27 set letter=27&goto concatenation
if errorlevel 26 set letter=26&goto concatenation
if errorlevel 25 set letter=25&goto concatenation
if errorlevel 24 set letter=24&goto concatenation
if errorlevel 23 set letter=23&goto concatenation
if errorlevel 22 set letter=22&goto concatenation
if errorlevel 21 set letter=21&goto concatenation
if errorlevel 20 set letter=20&goto concatenation
if errorlevel 19 set letter=19&goto concatenation
if errorlevel 18 set letter=18&goto concatenation
if errorlevel 17 set letter=17&goto concatenation
if errorlevel 16 set letter=16&goto concatenation
if errorlevel 15 set letter=15&goto concatenation
if errorlevel 14 set letter=14&goto concatenation
if errorlevel 13 set letter=13&goto concatenation
if errorlevel 12 set letter=12&goto concatenation
if errorlevel 11 set letter=11&goto concatenation
if errorlevel 10 set letter=10&goto concatenation
if errorlevel 9 set letter=9&goto concatenation
if errorlevel 8 set letter=8&goto concatenation
if errorlevel 7 set letter=7&goto concatenation
if errorlevel 6 set letter=6&goto concatenation
if errorlevel 5 set letter=5&goto concatenation
if errorlevel 4 set letter=4&goto concatenation
if errorlevel 3 set letter=3&goto concatenation
if errorlevel 2 set letter=2&goto concatenation
if errorlevel 1 goto pwd_check
goto concatenation

:concatenation
if %letter%==1 set letter=a
if %letter%==2 set letter=b
if %letter%==3 set letter=c
if %letter%==4 set letter=d
if %letter%==5 set letter=e
if %letter%==6 set letter=f
if %letter%==7 set letter=g
if %letter%==8 set letter=h
if %letter%==9 set letter=i
if %letter%==10 set letter=j
if %letter%==11 set letter=k
if %letter%==12 set letter=l
if %letter%==13 set letter=m
if %letter%==14 set letter=n
if %letter%==15 set letter=o
if %letter%==16 set letter=p
if %letter%==17 set letter=q
if %letter%==18 set letter=r
if %letter%==19 set letter=s
if %letter%==20 set letter=t
if %letter%==21 set letter=u
if %letter%==22 set letter=v
if %letter%==23 set letter=w
if %letter%==24 set letter=x
if %letter%==25 set letter=y
if %letter%==26 set letter=z
if %letter%==27 set letter=0
if %letter%==28 set letter=1
if %letter%==29 set letter=2
if %letter%==30 set letter=3
if %letter%==31 set letter=4
if %letter%==32 set letter=5
if %letter%==33 set letter=6
if %letter%==34 set letter=7
if %letter%==35 set letter=8
if %letter%==36 set letter=9
set pwd=%pwd%%letter%
set prompt=%prompt%%hide%
set /a counter=%counter%+1
if %counter%==%pwd_lngth% goto pwd_check
cls
set hide=%hide_char%
goto prompt_loop

:pwd_check
if NOT %pwd%==148700562910236792 (
goto fail
)
cls
color 0a
echo password_correct
ping localhost -n 5 >nul
exit

:fail
cls
color 0c
set /a fail_limit=%fail_limit%-1
if %fail_limit%==0 set /a no_access=1&exit
echo %pwd% is invalid
set hide=
ping localhost -n 5 >nul
cls
goto reset
