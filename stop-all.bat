@echo off
rem Arrete les services lances par start-all.bat (ports 8761, 8081-8085, 8093)
for %%p in (8761 8081 8082 8083 8084 8085 8093) do (
  for /f "tokens=5" %%a in ('netstat -ano ^| findstr /r /c:":%%p .*LISTENING"') do (
    echo Arret du port %%p ^(PID %%a^)
    taskkill /PID %%a /T /F >nul 2>&1
  )
)
echo Termine.
timeout /t 3 >nul
