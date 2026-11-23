@echo off
call "%~dp0_env.bat"
title eureka
cd /d "%~dp0eureka"
call mvnw.cmd spring-boot:run > "%~dp0logs\eureka.log" 2>&1
