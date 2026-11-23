@echo off
call "%~dp0_env.bat"
title meeting %1
cd /d "%~dp0microservices\meeting"
set "PORT=%1"
node src\server.js > "%~dp0logs\meeting-%1.log" 2>&1
