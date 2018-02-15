@ECHO OFF
::********************************************************************************************************************
:: Purpose	:	Patch�� ���� �մϴ�.
:: Creator	:	Kim Ki Won
:: Create	:	2016�� 12�� 7�� ������ ���� 7:48:24
:: Modifier	:	
:: Update	:	
:: Comment	:	
::				param1 : workingFolder : SPC ��
::				param2 : targetProc : SortPlanChanger ��
::				param3 : targetFTP : SPC ��
::				param4 : ftp upload ����
::********************************************************************************************************************

::************************************************************************************************************** Label
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 
:START

:: �������� �̸��� ����
SET workingFolder=%~1
SET targetProc=%~2
SET targetFTP=%~3
SET upload=%4

SET cwd=%~dp0
CD /d %cwd%

PUSHD ..\_PatchCreator
CALL _CreatePatch.cmd "%workingFolder%" "%targetProc%" noPrompt
POPD

SET cwd=%~dp0
ECHO.

IF "%upload%"=="" CHOICE /c YN /d Y /t 5 /m "�系 FTP�� Patch ������ ���ε� �Ͻðڽ��ϱ�?"
IF "%upload%"=="" IF "%ERRORLEVEL%"=="1" CALL "%cwd%__UploadFTP.cmd" "%outputFile%" /_9Projects/K-Packet/Patch/%targetFTP%/

GOTO END

::************************************************ Inner  Batch ************************************************ Label
:__
GOTO :EOF
::********************************************************************************************************************

::************************************************************************************************************** Label
:USAGE
ECHO.
ECHO  
ECHO.
ECHO    %~nx0 : ^< ^>
ECHO            
ECHO.
ECHO        ex) %~nx0 
ECHO.

::************************************************************************************************************** Label
:END
ENDLOCAL

EXIT
