@echo off
call "%~dp0_env.bat"
title candidat
cd /d "%~dp0microservices\candidat"
call "%MVNW%" spring-boot:run -Dmaven.test.skip=true > "%~dp0logs\candidat.log" 2>&1
