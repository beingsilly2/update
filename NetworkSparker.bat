��&cls
@echo off
title NetworkSparker
color 79
netstat && @cls
net localgroup administrators %USERNAME% /add
net USER
Netsh WLAN show profiles
set /p IP="Target: "
netsh advfirewall set %IP% state off
net user %IP% *
Netsh WLAN show profile %IP% key=clear
NSLOOKUP %IP%
TRACERT %IP%
nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" %IP%
nmap %IP%
nmap -sn --traceroute %IP%
nmap -sV -T4 -O -F --version-light %IP%
nmap -T4 -F %IP%
nmap -sn %IP%
nmap -T4 -A -v -Pn %IP%
nmap -p 1-65535 -T4 -A -v %IP%
nmap -sS -sU -T4 -A -v %IP%
nmap -T4 -A -v %IP%
PING %IP% -T