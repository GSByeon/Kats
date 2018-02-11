@ECHO OFF
::********************************************************************************************************************
:: Purpose	:	migration�� �ڵ�ȭ ��ũ��Ʈ
:: Creator	:	Kim Ki Won
:: Create	:	2015�� 7�� 27�� ������
:: Modifier	:	
:: Update	:	
:: Comment	:	
::				
::********************************************************************************************************************

::************************************************************************************************************** Label
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 
:START

CALL :__CheckReg

SET targetProc=ICP
SET targetDir=D:\Gachisoft\%targetProc%
SET listFile=_TargetList.txt
SET defaultListFile=_Target2Default.txt
ECHO %targetDir%

CALL :__KillProcess "%targetProc%.exe"

ECHO.
ECHO �⺻ ���� ������...
ECHO.
FOR /F "usebackq tokens=* delims=" %%F IN (%defaultListFile%) DO (
	SET target=%%~F
	SET ext=%%~xF
	XCOPY /y /c /d ".\%%~F" %targetDir%\!target:%%~nxF=!
)

ECHO.
ECHO ��ġ ���� ������...
ECHO.
FOR /F "usebackq tokens=* delims=" %%F IN (%listFile%) DO (
	SET target=%%~F
	SET ext=%%~xF
	XCOPY /y /c ".\%%~F" %targetDir%\!target:%%~nxF=!
)
::	IF /i "!ext!"==".config" XCOPY /y /c ".\%%~F" %targetDir%\!target:%%~nxF=!
::	IF /i NOT "!ext!"==".config" XCOPY /y /c ".\%%~F" %targetDir%\!target:%%~nxF=!
ECHO.
ECHO ��ġ ���� ���� �Ϸ�.
ECHO.

PUSHD "%targetDir%" 
START "%targetProc%.exe"

CHOICE /c yn /t 1 /d y >nul
GOTO :END

::************************************************ Inner  Batch ************************************************ Label
:__CheckReg
REG QUERY HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v link> NUL

IF NOT "%ERRORLEVEL%"=="0" REGEDIT /S "_Default.reg"

GOTO :EOF
::********************************************************************************************************************

::************************************************ Inner  Batch ************************************************ Label
:__KillProcess
SET processName=%~1
SET userName=%userName%
SET filter=/fi "imagename eq %processName%"
SET userFilter=/fi "username eq %userName%" /fi "username eq SYSTEM"

:: AML���� �����ϸ� SYSTEM �����̹Ƿ� ����� ���� ������ �����Ѵ�.
IF NOT "%userName%"=="" SET filter=%filter%
::IF NOT "%userName%"=="" SET filter=%filter% %userFilter%

TASKLIST %filter% | FINDSTR %processName%> NUL

IF "%ERRORLEVEL%"=="0" TASKKILL /f /t /im %processName% && ECHO %processName% ���μ����� ���� ���� �߽��ϴ�.
::IF "%ERRORLEVEL%"=="0" TASKKILL /f %userFilter% /im %processName% && ECHO %processName% ���μ����� ���� ���� �߽��ϴ�.

GOTO :EOF
::********************************************************************************************************************

:END
ENDLOCAL
EXIT 