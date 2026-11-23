@echo off
REM ============================================================
REM Futuristic Campus Smart Link - Lesson 2
REM 01-install-libraries.bat
REM Checks tools, installs libraries, writes a LOG for evidence
REM Double-click this file. Do NOT paste passwords/tokens.
REM ============================================================
setlocal EnableDelayedExpansion
title Futuristic Campus Smart Link - Install Libraries
if not exist logs mkdir logs
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set D=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set T=%%a-%%b
set LOG=logs\install-%D%_%T%.log
echo Futuristic Campus Smart Link - Install Log > "%LOG%"
echo Started: %DATE% %TIME% >> "%LOG%"
echo Project: futuristic-campus-smart-link.base44.app >> "%LOG%"
echo ================================================= >> "%LOG%"
echo.
echo Installing... please wait. Log: %LOG%
echo.
echo [1/4] Checking Python... 
python --version >> "%LOG%" 2>&1
if errorlevel 1 (
  echo ERROR: Python not found. Install Python 3 from python.org and tick ADD TO PATH. >> "%LOG%"
  echo ERROR: Python not found. Install it, tick ADD TO PATH, then run again.
  pause & exit /b 1
)
echo [2/4] Checking Node.js... >> "%LOG%"
node --version >> "%LOG%" 2>&1
if errorlevel 1 echo WARNING: Node.js not found. Base44 still works online. >> "%LOG%"
echo [3/4] Checking Git... >> "%LOG%"
git --version >> "%LOG%" 2>&1
if errorlevel 1 echo WARNING: Git not found. Install Git to use GitHub connect. >> "%LOG%"
echo [4/4] Installing Python libraries from requirements.txt... >> "%LOG%"
if exist requirements.txt (
  pip install -r requirements.txt >> "%LOG%" 2>&1
) else (
  pip install flask gunicorn requests >> "%LOG%" 2>&1
)
echo.
echo FINISHED: %DATE% %TIME% >> "%LOG%"
echo DONE! Open logs folder and screenshot this log.
pause >nul
