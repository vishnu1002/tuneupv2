@ECHO OFF

COLOR 0A

REM Run this batch file as Administrator!!

REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.

REM This program is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.
REM 
REM You should have received a copy of the GNU General Public License
REM along with this program.  If not, see <http://www.gnu.org/licenses/>.

REM Credit: This script has been changed from the original 
REM script made by illdecree GitHub Gist. 
REM <https://gist.github.com/illdecree/2051084>

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Deletes Microsoft Office .Ink files
REM And returns to Desktop

TITLE Tune Up v2.0

msg %username% /time:0 Please ensure all work is saved and all other windows are closed before you continue!

del /f /q "%userprofile%\Start Menu\Programs\Accessories\Program Compatibility Wizard.lnk"
del /f /q "%userprofile%\Start Menu\Programs\Accessories\Tour Windows XP.lnk"
del /f /q "%userprofile%\Start Menu\Programs\Remote Assistance.lnk"
del /f /q "%userprofile%\Start Menu\Programs\Outlook Express.lnk"
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\MSN.lnk"
del /f /q "C:\Documents and Settings\All Users\Start Menu\Programs\Windows Messenger.lnk"
del /f /q "C:\Documents and Settings\All Users\Start Menu\Set Program Access and Defaults.lnk"
del /f /q "C:\Documents and Settings\All Users\Start Menu\Windows Catalog.lnk"
del /f /q "C:\Documents and Settings\All Users\Start Menu\New Microsoft Office Document*"
del /f /q "C:\Documents and Settings\All Users\Start Menu\Open Microsoft Office Document*"
rd /s /q "C:\Documents and Settings\All Users\Start Menu\Programs\Games\"
CD /d "C:\Documents and Settings\All Users\Desktop"
del /f /q "Show Desktop*"
CD /d "%userprofile%\Desktop"
del /f /q "Show Desktop*"

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Main Menu

:BEGIN

:MENU

CLS
ECHO.
ECHO TuneUp v2.0
ECHO.
ECHO Hi %username% !
ECHO.
ECHO [ Please run the file as Administration ] 
ECHO [ Please close all open applications before making a selection ]
ECHO.
ECHO All of these options will help your computer run faster
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO    1.  Clear All Cache             Clean out cookies and temp files
ECHO    2.  Disk Cleanup                Clean out unnecessary files
ECHO    3.  Microsoft Defender Scan     Scan your computer for viruses (takes minimum 15 mins)
ECHO    4.  Check Disk                  Checks hard drive for errors (requires a Reboot)
if exist "C:\PROGRA~1\CCleaner\" ECHO    5.  CCleaner                    In depth cleaning. Cleans lots of temp files
ECHO.
ECHO    0.  Deep Clean                  Run all options above (takes minimim 20 mins)
ECHO.
ECHO    q. Quit
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHo.
SET INPUT=
ECHO Select a number and press [Enter]
SET /P INPUT=">> "

IF /I '%INPUT%'=='1' GOTO Selection1                             
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='3' GOTO Selection3
IF /I '%INPUT%'=='4' GOTO Selection4
IF /I '%INPUT%'=='5' GOTO Selection5
IF /I '%INPUT%'=='0' GOTO Selection0
IF /I '%INPUT%'=='Q' EXIT
rem IF /I '%INPUT%'=='H' GOTO HELP
rem IF /I '%INPUT%'=='V' GOTO VIEWSOURCE

CLS
ECHO.
ECHO Invalid Option!
ECHO.
ECHO Press any key ... to try again!
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Cleaning all Temp Files
:Selection1

CLS
ECHO.
ECHO.
ECHO Now Clearing Temp Files...
ECHO.

ECHO [ TEMP CACHE ]
ECHO.
del /s /q /f %windir%\temp\*.*
ECHO.
del /s /q /f %windir%\prefetch\*.*
ECHO.
del /s /q /f C:\Users\%username%\AppData\Local\Temp\*.*
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ C DRIVE CACHE ]
ECHO.
if exist %systemdrive%\*._mp ( 
    ECHO ._mp exist
    del /s /q /f %systemdrive%\*._mp
    ) else ( 
        ECHO ._mp File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.log>nul
if exist %systemdrive%\*.log ( 
    ECHO .log exist
    del /s /q /f %systemdrive%\*.log
    ) else ( 
        ECHO .log File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.gid>nul
if exist %systemdrive%\*.gid ( 
    ECHO .gid exist
    del /s /q /f %systemdrive%\*.gid
    ) else ( 
        ECHO .gid File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.chk>nul
if exist %systemdrive%\*.chk ( 
    ECHO .chk exist
    del /s /q /f %systemdrive%\*.chk
    ) else ( 
        ECHO .chk File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.old>nul
if exist %systemdrive%\*.old ( 
    ECHO .old exist
    del /s /q /f %systemdrive%\*.old
    ) else ( 
        ECHO .old File Not Found... )
ECHO.
if exist %systemdrive%\*.bak ( 
    ECHO .bak exist
    del /s /q /f %systemdrive%\*.bak
    ) else ( 
        ECHO .bak File Not Found... )
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ WINDOWS SOFTWARE DISTRIBUTION ]
ECHO.
rmdir /s /q C:\Windows\SoftwareDistribution\Download\
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ NVIDIA CATCHE ]
ECHO.
del /s /f /q C:\ProgramData\NVIDIA\*.*
rmdir /s /q  C:\ProgramData\NVIDIA Corporation\NV_Cache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA\GLCache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA\DXCache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA Corporation\NV_Cache\
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ DNS FLUSH ]
ECHO.
ipconfig /flushdns
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.

ECHO Temp File process finished!
ECHO.
ECHO.
ECHO Press any key to [MAIN MENU]...
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Running Disk Cleanup
:Selection2

CLS
ECHO.
ECHO.
ECHO Now running Disk Cleanup...
ECHO.
c:\windows\system32\cleanmgr.exe /dc /sagerum: 1

ECHO.
ECHO Disk Cleanup process finished!
ECHO.
ECHO Press any key to [MAIN MENU]...
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:Selection3
REM Running Microsoft Defender Antivirus

CLS
ECHO.
ECHO.
ECHO Now scanning for viruses...
ECHO This will take a while.

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sfc/scannow
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CD C:\ProgramData\Microsoft\Windows Defender\Platform\4.18*
ECHO.
ECHO Updating Microsoft Defender Antivirus:
ECHO.
MpCmdRun -SignatureUpdate

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Quick Scan:
MpCmdRun -Scan -ScanType 1

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Boot Sector Scan:
MpCmdRun -Scan -ScanType -BootSectorScan

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ECHO.
ECHO Virus scan complete!
ECHO.
ECHO.
ECHO Press any key to [MAIN MENU]...
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Scheduling Check Disk
:Selection4

CLS
ECHO.
ECHO.
ECHO Scheduling Check Disk...
ECHO.
chkdsk /r

ECHO.
:CDchoice
set /P c=Reboot now to begin Check Disk? [Y/N] 
if /I "%c%" EQU "Y" goto :CDREBOOT
if /I "%c%" EQU "N" goto :CDQUIT
goto :CDchoice
GOTO Quit

:CDREBOOT
taskkill /IM explorer.exe /F
shutdown -r -t 0
CLS

ECHO.
ECHO Check Disk will begin after next reboot!
ECHO.
ECHO.
ECHO Press any key to [MAIN MENU]...
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM Running CCleaner if application exist
:Selection5

CLS
ECHO.
ECHO.
ECHO CCleaner now running...
ECHO.
C:\PROGRA~1\CCleaner\CCleaner.exe /AUTO

ECHO.
ECHO CCleaner finished cleaning your hard drive!
ECHO.
ECHO.
ECHO Press any key to [MAIN MENU]...
PAUSE > NUL
GOTO MENU

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:Selection0
REM Runs all the above script in one go!
REM This might take around 20 mins to finish

CLS
ECHO.
ECHO.
ECHO Starting Deep Clean...
ECHO.

ECHO CCleaner now running...
if exist "C:\PROGRA~1\CCleaner\" C:\PROGRA~1\CCleaner\CCleaner.exe /AUTO

ECHO [ TEMP CACHE ]
ECHO.
del /s /q /f %windir%\temp\*.*
ECHO.
del /s /q /f %windir%\prefetch\*.*
ECHO.
del /s /q /f C:\Users\%username%\AppData\Local\Temp\*.*
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ C DRIVE CACHE ]
ECHO.
if exist %systemdrive%\*._mp ( 
    ECHO ._mp exist
    del /s /q /f %systemdrive%\*._mp
    ) else ( 
        ECHO ._mp File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.log>nul
if exist %systemdrive%\*.log ( 
    ECHO .log exist
    del /s /q /f %systemdrive%\*.log
    ) else ( 
        ECHO .log File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.gid>nul
if exist %systemdrive%\*.gid ( 
    ECHO .gid exist
    del /s /q /f %systemdrive%\*.gid
    ) else ( 
        ECHO .gid File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.chk>nul
if exist %systemdrive%\*.chk ( 
    ECHO .chk exist
    del /s /q /f %systemdrive%\*.chk
    ) else ( 
        ECHO .chk File Not Found... )
ECHO.
rem del /s /q /f %systemdrive%\*.old>nul
if exist %systemdrive%\*.old ( 
    ECHO .old exist
    del /s /q /f %systemdrive%\*.old
    ) else ( 
        ECHO .old File Not Found... )
ECHO.
if exist %systemdrive%\*.bak ( 
    ECHO .bak exist
    del /s /q /f %systemdrive%\*.bak
    ) else ( 
        ECHO .bak File Not Found... )
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ WINDOWS SOFTWARE DISTRIBUTION ]
ECHO.
rmdir /s /q C:\Windows\SoftwareDistribution\Download\
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ NVIDIA CATCHE ]
ECHO.
del /s /f /q C:\ProgramData\NVIDIA\*.*
rmdir /s /q  C:\ProgramData\NVIDIA Corporation\NV_Cache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA\GLCache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA\DXCache\
rmdir /s /q  C:\Users\%USERNAME%\AppData\Local\NVIDIA Corporation\NV_Cache\
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO [ DNS FLUSH ]
ECHO.
ipconfig /flushdns
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.

CLS
ECHO.
ECHO.
ECHO Scanning for viruses...
ECHO This will take a while.
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sfc/scannow
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CD C:\ProgramData\Microsoft\Windows Defender\Platform\4.18*
ECHO.
ECHO Updating Microsoft Defender Antivirus:
ECHO.
MpCmdRun -SignatureUpdate

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Quick Scan:
MpCmdRun -Scan -ScanType 1

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Boot Sector Scan:
MpCmdRun -Scan -ScanType -BootSectorScan

ECHO.
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CLS
ECHO.
ECHO.
chkdsk /r
c:\windows\system32\cleanmgr.exe /dc /sagerum: 1
ECHO.

CLS
ECHO.
ECHO.
ECHO Rebooting now. Check Disk will begin after reboot...
shutdown -r -f -t 0
PAUSE>nul

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:Quit

:choice
cls
IF /I '%INPUT%'=='1' ECHO Temp File process finished!
IF /I '%INPUT%'=='2' ECHO Disk Cleanup process finished!
IF /I '%INPUT%'=='3' ECHO Virus scan complete!
IF /I '%INPUT%'=='4' ECHO Check Disk will begin after next reboot!
IF /I '%INPUT%'=='5' ECHO CCleaner finished cleaning your hard drive!
IF /I '%INPUT%'=='0' ECHO Deep Clean Finished!
ECHO.

:CDQUIT
ECHO.
set /P c=Would you like to perform another task? [Y/N]: 
if /I "%c%" EQU "Y" goto :begin
if /I "%c%" EQU "N" goto :EXIT
goto :choice

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:EXIT

cls
ECHO.
ECHO.
ECHO +++++++++++++++++++++++++++++++++++++
ECHO Thank You!
ECHO +++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Press any key to exit...

PAUSE>NUL
EXIT

REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
