��&cls
@echo off
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/beingsilly2/update/main/BatchUpdateMaker.bat" -OutFile "%~n0.bat"
if /i "%~2"=="-Ref" goto prompt2
if "%~1"=="" break
if /i "%~x1" neq "" if /i "%~x1" neq "" break
for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil.exe not found.
  pause
  exit /b
)
if /i "%~1"=="-prompt" goto prompt
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%~n1r%~x1"
del "temp.~b64"
copy "%~n1%~x1" /b + "%~1" /b
%~n0.bat -prompt
exit /b
:prompt
set /p Uri="RawTextUrl:"
set /p OutFile="File:"
>"update.bat" echo @echo off
echo powershell -Command Invoke-WebRequest -Uri "%Uri%" -OutFile "%OutFile%" >> update.bat
%~n0.bat update.bat -Ref
:prompt2
if "%~1"=="" break
if /i "%~x1" neq "" if /i "%~x1" neq "" break
for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil.exe not found.
  pause
  exit /b
)
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%~n1r%~x1"
del "temp.~b64"
copy "%~n1r%~x1" /b + "%~1" /b
del update.bat
exit /b
