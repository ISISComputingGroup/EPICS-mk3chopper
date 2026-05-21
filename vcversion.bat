REM
REM when changing also need to update values in  Mk3ChopperApp/src/Makefile
REM

for /F "tokens=1,2,3 delims=. " %%a in ("%VSCMD_VER%") do (
   set VS_MAJOR=%%a
   set VS_MINOR=%%b
   set VS_SU=%%c
)

if "%VS_MAJOR%" == "18" (
    REM VS2026
    set PLATFORM_TOOLSET=v144
    set TARGET_FRAMEWORK_VERSION=v4.7.2
    exit /b 0
)
if "%VS_MAJOR%" == "17" (
    REM VS2022
    set PLATFORM_TOOLSET=v143
    set TARGET_FRAMEWORK_VERSION=v4.7.2
    exit /b 0
)
REM VS2019
set PLATFORM_TOOLSET=v142
set TARGET_FRAMEWORK_VERSION=v4.0
