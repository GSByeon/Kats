@ECHO OFF
::********************************************************************************************************************
:: Purpose	:	git working repository���� ����� AssemblyInfo.cs ������ revert �մϴ�.
:: Creator	:	Kim Ki Won
:: Create	:	2016�� 9�� 28�� ������ ���� 3:28:53
:: Modifier	:	
:: Update	:	
:: Comment	:	
::				
::********************************************************************************************************************

::************************************************************************************************************** Label
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 
:START

SET targetFolder=%~dp0
SET targetFile=AssemblyInfo.cs

SET git=D:\CI\git\bin\git.exe

IF NOT EXIST "%git%" SET git=%ProgramFiles%\Git\bin\git.exe

PUSHD "%targetFolder%"

"%git%" status | FindStr %targetFile%

ECHO.
IF "%ERRORLEVEL%"=="1" ECHO Revert �� %targetFile% �� �����ϴ�. && GOTO LAST
ECHO.
CHOICE /c YN /m "�������� ������ Revert �Ͻðڽ��ϱ�?"
ECHO.

IF "%ERRORLEVEL%"=="1" FOR /F "usebackq tokens=2,* delims=: " %%F IN (`"%git%" status ^| FindStr %targetFile%`) DO @ECHO %%F && "%git%" checkout %%F

ECHO.
::PAUSE 

:LAST
POPD

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
