@echo off
call "%~dp0_env.bat"
title job
cd /d "%~dp0microservices\job"
call "%MVNW%" spring-boot:run -Dmaven.test.skip=true > "%~dp0logs\job.log" 2>&1
