@ECHO OFF
::********************************************************************************************************************
:: Purpose	:	������ ������ FTP�� ���ε�
:: Creator	:	Kim Ki Won
:: Create	:	2016�� 9�� 25�� �Ͽ��� ���� 10:47:31
:: Modifier	:	
:: Update	:	
:: Comment	:	
::				
::********************************************************************************************************************

::************************************************************************************************************** Label
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 
:START

SET cwd=%~dp0
CD /d %cwd%

IF NOT EXIST "%~1" ECHO. && ECHO �ش� ������ �����ϴ�. && ECHO. && PAUSE && GOTO :END

SET winscp=..\_Utils\WinSCP\winSCP
SET mlsFTP=x10.iptime.org
SET userName=contract
SET password=a12345678B
SET port=21
SET server=ftp://%userName%:%password%@%mlsFTP%:%port%
SET local=%~1
SET remote=%2

ECHO.
ECHO �系 FTP�� ���ε�
ECHO "%WinSCP%" /command "option batch off" "option confirm on" "option transfer binary" "open %server% -passive=ON" "put ""%local%"" %remote% -neweronly" "exit"
"%WinSCP%" /command "option batch off" "option confirm on" "option transfer binary" "open %server% -passive=ON" "put ""%local%"" %remote% -neweronly" "exit"


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
