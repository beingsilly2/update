@Echo off
@powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/beingsilly2/update/main/FixTool5.bat" -OutFile "FixTool5.bat"
@Mode 77,33
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>temp.reg
ECHO "NoFolderOptions"=->>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>temp.reg
ECHO "HideFileExt"=dword:00000000>>temp.reg
ECHO "Hidden"=dword:00000002>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt]>>temp.reg
ECHO "UncheckedValue"=dword:00000000>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden]>>temp.reg
ECHO "UncheckedValue"=dword:00000001>>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt]>>temp.reg
ECHO "CheckedValue"=dword:00000001>>temp.reg
ECHO "DefaultValue"=dword:00000001>>temp.reg
ECHO "Text"="@shell32.dll,-30503">>temp.reg
ECHO "Type"="checkbox">>temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]>>temp.reg
ECHO "DisableTaskMgr"=dword:00000000>>temp.reg
REG import temp.reg
ECHO.>>temp.reg
ECHO [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>temp.reg
ECHO "DisableRegistryTools"=dword:00000000>>temp.reg
REG import temp.reg
del /f temp.reg
netsh int ip reset
netsh winsock reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
bootsect /nt52 C:
bootsect /nt60 C:
bootsect /nt52 C:\Windows
bootsect /nt60 C:\Windows
bootsect /nt52 C:\Windows\System32
bootsect /nt60 C:\Windows\System32
bootsect /nt52 C:\Users
bootsect /nt60 C:\Users
bootsect /nt52 C:\Program Files (x86)
bootsect /nt60 C:\Program Files
wbadmin start backup -backuptarget:E: -include:C: -allCritical
wbadmin get versions -backupTarget:D
wbadmin start sysrecovery -version -backuptarget:D
SFC
CHKDSK
Fsutil behavior query memoryusage
Fsutil behavior set memoryusage 2
chkdsk /r c:
chkdsk /r d:
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /RestoreHealth /Source:repairSource\install.wim
MdSched
shutdown /r
@Mode 999999,999999
@Mode 0,0
