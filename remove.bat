@echo off
IF EXIST temp.bat del temp.bat
IF EXIST Utility2007_06.exe del Utility2007_06.exe
WHERE elevate
IF %ERRORLEVEL% EQU 0 (
set input=y
goto :skip
)
set input=n
bitsadmin /transfer DL  /download /priority high http://download.microsoft.com/download/f/d/0/fd05def7-68a1-4f71-8546-25c359cc0842/Utility2007_06.exe %CD%/Utility2007_06.exe
echo Make sure you download this program to the current folder, %CD%
pause
start /wait Utility2007_06.exe
:skip
echo 1
echo @echo off>>temp.bat
echo set /p input=What file extention would you like to remove from the New menu: %%^=%%>>temp.bat
echo REG DELETE HKEY_CLASSES_ROOT\%%input%%\ShellNew>>temp.bat>>temp.bat
echo echo Removed %%input%% from the New list!>>temp.bat
echo pause>>temp.bat
echo del Utility2007_06.exe>>temp.bat
echo 2
IF %input% EQU n (
"%CD%\Utility\elevate.cmd" cmd "temp.bat" 
) ELSE (
elevate "temp.bat"
)
del temp.bat
RD /S /Q %CD%\Utility
