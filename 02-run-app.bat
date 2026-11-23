@echo off
REM ============================================================
REM Futuristic Campus Smart Link - Lesson 2
REM 02-run-app.bat - Opens LIVE site + local preview + RUN LOG
REM Run AFTER 01-install-libraries.bat
REM ============================================================
setlocal
title Futuristic Campus Smart Link - Run App
if not exist logs mkdir logs
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set D=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set T=%%a-%%b
set LOG=logs\run-%D%_%T%.log
echo Futuristic Campus Smart Link - Run Log > "%LOG%"
echo Started: %DATE% %TIME% >> "%LOG%"
echo Live Base44 URL: https://futuristic-campus-smart-link.base44.app >> "%LOG%"
echo.
echo Opening your LIVE Base44 site...
start https://futuristic-campus-smart-link.base44.app
echo.
echo Starting local preview on http://localhost:8000
echo Press CTRL+C to stop. This window IS your run log proof.
echo ============================================================
python -m http.server 8000 >> "%LOG%" 2>&1
pause
