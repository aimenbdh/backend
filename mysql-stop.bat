@echo off
rem Simule une panne de la base : arrete MySQL (XAMPP)
taskkill /IM mysqld.exe /F
timeout /t 2 >nul
