@echo off
rem Lance les microservices (Eureka doit deja tourner sur 8761)
call "%~dp0_env.bat"
cd /d "%~dp0"
start "candidat" /min cmd /c "%~dp0run-candidat.bat"
start "mysql-job" /min cmd /c "%~dp0run-mysql-job.bat"
start "candidature" /min cmd /c "%~dp0run-candidature.bat"
start "meeting-8083" /min cmd /c "%~dp0run-meeting.bat" 8083
start "meeting-8093" /min cmd /c "%~dp0run-meeting.bat" 8093
start "notification" /min cmd /c "%~dp0run-notification.bat"
