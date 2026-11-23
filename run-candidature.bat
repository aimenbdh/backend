@echo off
call "%~dp0_env.bat"
title candidature
cd /d "%~dp0microservices\canditature"
call mvnw.cmd spring-boot:run > "%~dp0logs\candidature.log" 2>&1
