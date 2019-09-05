@echo off
CLS
set currentpath=D:\temp\_installers\choco-autoinstaller

echo "original script from: https://gitlab.com/luukgrefte/choco-autoinstalller/"
echo "Starting automatic file installation by chocolatey"
echo "Script made by Luukgr"
echo "Run at your own risk"
echo "Script needs to run in admin mode"
ECHO.
:MENU
ECHO ...............................................
ECHO PRESS 1 thru 5 to select your task, or 6 to EXIT.
ECHO FIRST TIME press 4 to install choco!
ECHO ...............................................
ECHO.
ECHO 1 - Basic Apps (chrome, vscode, git)
ECHO 2 - Dev Apps (python, nodejs)
ECHO 3 - User/Work Apps Only (1password, spotify)
ECHO 4 - Chocolatey
ECHO 5 - Upgrade apps
ECHO 6 - EXIT
ECHO.


SET /P M=Type 1 thru 6 then press ENTER:
IF %M%==1 GOTO GEN
IF %M%==2 GOTO DEV
IF %M%==3 GOTO PER
IF %M%==4 GOTO FIR
IF %M%==5 GOTO UPG
IF %M%==6 GOTO EOF


REM developer tools
:FIR
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n allowGlobalConfirmation
choco upgrade chocolatey
ECHO ...............................................
ECHO A RESTART OF THE BATCH FILE IS MAYBE NECESSARY!!
ECHO ...............................................
ECHO ...............................................
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:GEN
REM basic apps
choco install %currentpath%\defaultapps.config   
IF %M%==2 GOTO DEV
GOTO MENU

:DEV
REM developer tools
choco install %currentpath%\devapps.config   
GOTO MENU

:PER
REM personal apps
choco install %currentpath%\personal.config   
GOTO MENU

:EOF