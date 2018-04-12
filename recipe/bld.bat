setlocal EnableDelayedExpansion

:: Configure
if "%ARCH%" == "32" (
  set SLN_PLAT=Win32
) else (
  set SLN_PLAT=x64
)

if "%VS_YEAR%" == "2008" (
  call vcbuild /upgrade msvc\libusb_dll_2005.vcproj
  if errorlevel 1 exit 1
  call vcbuild /upgrade msvc\libusb_static_2005.vcproj
  if errorlevel 1 exit 1
  call vcbuild /upgrade msvc\listdevs_2005.vcproj
  if errorlevel 1 exit 1
  call vcbuild /upgrade msvc\stress_2005.vcproj
  if errorlevel 1 exit 1
  call vcbuild /upgrade msvc\xusb_2005.vcproj
  if errorlevel 1 exit 1
  set SLN_FILE="msvc\libusb_2005.sln"
  set TOOLSET=v90
  set FRAMEWORK=v3.5
)
if "%VS_YEAR%" == "2010" (
  set SLN_FILE="msvc\libusb_2010.sln"
  set TOOLSET=v100
  set FRAMEWORK=v4.0
)
if "%VS_YEAR%" == "2015" (
  set SLN_FILE="msvc\libusb_2015.sln"
  set TOOLSET=v140
  set FRAMEWORK=v4.6
)

:: Build
msbuild "%SLN_FILE%" ^
  /p:Configuration="Release" ^
  /p:Platform="%SLN_PLAT%" ^
  /p:PlatformToolset="%TOOLSET%" ^
  /p:TargetFrameworkVersion="%FRAMEWORK%" ^
  /verbosity:normal
if errorlevel 1 exit 1

:: Install
copy %SRC_DIR%\%SLN_PLAT%\Release\dll\libusb-1.0.dll %LIBRARY_BIN%\usb-1.0.dll
if errorlevel 1 exit 1
copy %SRC_DIR%\%SLN_PLAT%\Release\dll\libusb-1.0.lib %LIBRARY_LIB%\usb-1.0.lib
if errorlevel 1 exit 1
copy %SRC_DIR%\%SLN_PLAT%\Release\lib\libusb-1.0.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
mkdir %LIBRARY_INC%\libusb-1.0
copy %SRC_DIR%\libusb\libusb.h %LIBRARY_INC%\libusb-1.0\
if errorlevel 1 exit 1
