@echo off

if /I "%EPICS_HOST_ARCH%" == "windows-x64-debug" (
    call msbuild.exe /p:Configuration=Debug;Platform=x64 /t:clean Mk3_Chopper.sln
	if %ERRORLEVEL% neq 0 goto PROBLEM
)

if /I "%EPICS_HOST_ARCH%" == "windows-x64" (
    call msbuild.exe /p:Configuration=Release;Platform=x64 /t:clean Mk3_Chopper.sln
	if %ERRORLEVEL% neq 0 goto PROBLEM
)
    
if /I "%EPICS_HOST_ARCH%" == "win32-x86-debug" (
    call msbuild.exe /p:Configuration=Debug;Platform=x86 /t:clean Mk3_Chopper.sln
	if %ERRORLEVEL% neq 0 goto PROBLEM
)

if /I "%EPICS_HOST_ARCH%" == "win32-x86" (
    call msbuild.exe /p:Configuration=Release;Platform=x86 /t:clean Mk3_Chopper.sln
	if %ERRORLEVEL% neq 0 goto PROBLEM
)

GOTO :EOF

:PROBLEM

@echo mk3chopper Clean Failed
exit /b 1
