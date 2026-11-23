@echo off
rem Arrete les microservices (pas Eureka) puis les relance
for %%p in (8081 8082 8083 8084 8085 8093) do (
  for /f "tokens=5" %%a in ('netstat -ano ^| findstr /r /c:":%%p .*LISTENING"') do taskkill /PID %%a /T /F >nul 2>&1
)
timeout /t 3 /nobreak >nul
call "%~dp0start-clients.bat"
