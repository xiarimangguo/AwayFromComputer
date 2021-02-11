@echo off
rem ---------------------------------------------------------------------- 
rem | This program can disable some programs on your computer                                          |
rem | By @xiarimangguo // My Github: https://github.com/xiarimangguo/                                   |
rem | If  you like this, don't forget to give me a star on Github!!!                                                   |
rem ---------------------------------------------------------------------- 
rem Hide cmd window
if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
rem Set output encoding
chcp 437
rem Enable variable delay
setlocal enabledelayedexpansion
rem ---------------------------------------------------------------------- 
rem List the programs you want to ban below
rem ---------------------------------------------------------------------- 
set lp1=chrome.exe
set lp2=msedge.exe
set lp3=iexplore.exe
set lp4=your.exe
set lp5=your.exe
set lp6=
set lp7=
set lp8=
set lp9=
set lp10=
set lp11=
set lp12=
set lp13=
set lp14=
set lp15=
set lp16=
set lp17=
set lp18=
set lp19=
set lp20=
rem ---------------------------------------------------------------------- 
:Findexe
rem Scan for running programs
rem Generate temporary files
tasklist /fi "status eq running" > D:\running.txt
rem Set variable "%%i" increment from 1 to 10, the step size is 1
for /l %%i in (1,1,20) do (
rem Loop out variables "lp%%i"
rem Use 'set lp%%i' to correctly take out the variables in the for loop
rem The command 'set lp%%i' can output like this, "lp1=value", "lp2=value", ...
rem If you do it like this, "%lp%%i%", You will Not get the value of the variable, and get an Error!
rem Use "for /f" to Split the string
for /f "delims=^= tokens=2 " %%l in ('set lp%%i') do (
rem Find the running program from the disabled list
findstr %%l D:\running.txt && (
rem Put the found program into the end processes list
set kp%%i=%%l
)
)
)
rem Initialize variable "%errorlevel%"
ver > nul
rem Iterate over variables starting with "kp"
set kp
rem Determine if it exists
if %errorlevel% == 0 (
rem If it exists, then goto Killexe
goto Killexe
) else (
rem If it not exists, then goto Findexe
goto Findexe
)
:Killexe
rem Set variable "%%i" increment from 1 to 10, the step size is 1
for /l %%i in (1,1,20) do (
rem Loop out variables "kp%%i"
for /f "delims=^= tokens=2 " %%l in ('set kp%%i') do (
rem Kill the programs
taskkill /f /im %%l /t
rem Initialize variable "kp%%i"
set kp%%i=
)
)
rem !!!NOTICE!!!: You can delete this if you do not need this function. (It is DESTRUCTIVE!!!)
rem (It is currently not enabled.)
::start Shutdown.bat
::exit
rem Loop detection
goto Findexe