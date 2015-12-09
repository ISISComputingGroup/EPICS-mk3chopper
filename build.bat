@echo off

REM Create an EPICS style layout
mkdir bin\%EPICS_HOST_ARCH%
mkdir lib\%EPICS_HOST_ARCH%

if /I "%EPICS_HOST_ARCH%" == "windows-x64-debug" (
    call msbuild.exe /p:Configuration=Debug;Platform=x64 Mk3_Chopper.sln
    copy x64\Debug\*.lib lib\%EPICS_HOST_ARCH%
    copy x64\Debug\*.dll bin\%EPICS_HOST_ARCH%
)

if /I "%EPICS_HOST_ARCH%" == "windows-x64" (
    call msbuild.exe /p:Configuration=Release;Platform=x64 Mk3_Chopper.sln
    copy x64\Release\*.lib lib\%EPICS_HOST_ARCH%
    copy x64\Release\*.dll bin\%EPICS_HOST_ARCH%
)
    
if /I "%EPICS_HOST_ARCH%" == "win32-x86-debug" (
    call msbuild.exe /p:Configuration=Debug;Platform=x86 Mk3_Chopper.sln
    copy Debug\*.lib lib\%EPICS_HOST_ARCH%
    copy Debug\*.dll bin\%EPICS_HOST_ARCH%
)

if /I "%EPICS_HOST_ARCH%" == "win32-x86" (
    call msbuild.exe /p:Configuration=Release;Platform=x86 Mk3_Chopper.sln
    copy Release\*.lib lib\%EPICS_HOST_ARCH%
    copy Release\*.dll bin\%EPICS_HOST_ARCH%
)