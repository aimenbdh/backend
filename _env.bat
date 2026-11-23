@echo off
set "BACKEND=%~dp0"
set "JAVA_HOME=%USERPROFILE%\.jdks\ms-17.0.20.1"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "MVNW=%~dp0eureka\mvnw.cmd"
if not exist "%~dp0logs" mkdir "%~dp0logs"
