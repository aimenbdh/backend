@echo off
call "%~dp0_env.bat"
cd /d C:\xampp
(
tasklist /fi "imagename eq mysqld.exe" | find /i "mysqld.exe" >nul
if errorlevel 1 (
  echo starting mysqld
  start "mysql" /min C:\xampp\mysql\bin\mysqld.exe --defaults-file=C:\xampp\mysql\bin\my.ini --standalone
  timeout /t 12 /nobreak >nul
)
C:\xampp\mysql\bin\mysql.exe -u root -e "use job_db"
if errorlevel 1 (
  echo importing job_db.sql
  C:\xampp\mysql\bin\mysql.exe -u root < "%~dp0microservices\job\database\job_db.sql"
) else (
  echo job_db already exists, not touched
)
C:\xampp\mysql\bin\mysql.exe -u root -e "show databases"
) > "%~dp0logs\mysql.log" 2>&1
timeout /t 15 /nobreak >nul
netstat -ano | find ":8082 " | find "LISTENING" >nul
if errorlevel 1 start "job" /min cmd /c "%~dp0run-job.bat"
