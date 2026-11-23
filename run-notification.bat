@echo off
call "%~dp0_env.bat"
title notification
cd /d "%~dp0microservices\notification"
python -m pip install -r requirements.txt > "%~dp0logs\pip.log" 2>&1
set "PORT=8084"
python -m app.main > "%~dp0logs\notification.log" 2>&1
