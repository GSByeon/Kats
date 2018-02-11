@ECHO OFF
::********************************************************************************************************************
:: Purpose	:	TortoiseGit �α׸� ��ȸ �մϴ�.
:: Creator	:	Kim Ki Won
:: Create	:	2016�� 9�� 28�� ������ ���� 6:08:23
:: Modifier	:	
:: Update	:	
:: Comment	:	
::				
::********************************************************************************************************************

::************************************************************************************************************** Label
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 
:START

SET targetFolder=%~dp0
SET git=D:\CI\git\bin\git.exe
SET tortoiseGitFolder=D:\CI\TortoiseGit\bin

IF NOT EXIST "%git%" SET git=%ProgramFiles%\Git\bin\git.exe
IF NOT EXIST "%tortoiseGitFolder%" SET tortoiseGitFolder=%ProgramFiles%\TortoiseGit

PUSHD "%targetFolder%"

START %tortoiseGitFolder%\TortoiseGitProc.exe /command:log "%~dp0%"
EXIT

POPD
EXIT

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

