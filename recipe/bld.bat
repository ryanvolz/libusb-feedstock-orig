setlocal EnableDelayedExpansion
@echo on

:: Configure
if "%ARCH%" == "32" (
  set SLN_PLAT=Win32
) else (
  set SLN_PLAT=x64
)

if "%VS_YEAR%" == "2015" (
  set "SLN_FILE=msvc\libusb_2015.sln"
)
if "%VS_YEAR%" == "2017" (
  set "SLN_FILE=msvc\libusb_2017.sln"
)
if "%VS_YEAR%" == "2019" (
  set "SLN_FILE=msvc\libusb_2019.sln"
)

set "MSBUILD_CMD=%VSINSTALLDIR%MSBuild\%VS_VERSION%\Bin\MSBuild.exe"
if not exist "%MSBUILD_CMD%" (
  :: Azure has at least VS 2017
  :: find VS 2017+ installations using vswhere tool
  echo Searching for MSBuild using vswhere...
  set "VSWHERE_CMD=C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe"
  if not exist "!VSWHERE_CMD!" (
    set "VSWHERE_CMD=vswhere"
  )
  echo vswhere path: !VSWHERE_CMD!
  for /f "usebackq tokens=*" %%i in (`"!VSWHERE_CMD!" -latest -products * -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
    set "MSBUILD_CMD=%%i"
  )
  echo MSBuild path: !MSBUILD_CMD!
)

:: Build
"%MSBUILD_CMD%" "%SLN_FILE%" ^
  /p:Configuration="Release" ^
  /p:Platform="%SLN_PLAT%" ^
  /verbosity:normal
if errorlevel 1 exit 1

:: Install
copy %SRC_DIR%\%SLN_PLAT%\Release\dll\libusb-1.0.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy %SRC_DIR%\%SLN_PLAT%\Release\dll\libusb-1.0.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy %SRC_DIR%\%SLN_PLAT%\Release\dll\libusb-1.0.pdb %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy %SRC_DIR%\%SLN_PLAT%\Release\lib\libusb-1.0.lib %LIBRARY_LIB%\libusb-1.0_static.lib
if errorlevel 1 exit 1
mkdir %LIBRARY_INC%\libusb-1.0
copy %SRC_DIR%\libusb\libusb.h %LIBRARY_INC%\libusb-1.0\
if errorlevel 1 exit 1
