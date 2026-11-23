@echo off
call "%~dp0_env.bat"
cd /d "%~dp0"
(
echo === mysqld process
tasklist /fi "imagename eq mysqld.exe"
echo === xampp
if exist C:\xampp\mysql\bin\mysqld.exe echo C:\xampp found
echo === wamp
dir /b C:\wamp64\bin\mysql 2>nul
dir /b C:\wamp\bin\mysql 2>nul
echo === Program Files MySQL
dir /b "C:\Program Files\MySQL" 2>nul
echo === services
sc query state= all | findstr /i "mysql maria"
echo === java
java -version
) > logs\env.txt 2>&1
start "eureka" /min cmd /c "%~dp0run-eureka.bat"
timeout /t 25 /nobreak > nul
start "candidat" /min cmd /c "%~dp0run-candidat.bat"
start "job" /min cmd /c "%~dp0run-job.bat"
start "candidature" /min cmd /c "%~dp0run-candidature.bat"
start "meeting-8083" /min cmd /c "%~dp0run-meeting.bat" 8083
start "meeting-8093" /min cmd /c "%~dp0run-meeting.bat" 8093
start "notification" /min cmd /c "%~dp0run-notification.bat"
