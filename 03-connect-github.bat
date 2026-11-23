@echo off
REM ============================================================
REM Futuristic Campus Smart Link - Lesson 2
REM 03-connect-github.bat - Connects folder to GitHub + pushes + logs
REM Run ONCE after you create an EMPTY repo on github.com
REM Edit ONLY the line: set REPO_URL=...
REM ============================================================
setlocal
title Futuristic Campus Smart Link - Connect GitHub
if not exist logs mkdir logs
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set D=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set T=%%a-%%b
set LOG=logs\github-%D%_%T%.log
echo Futuristic Campus Smart Link - GitHub Log > "%LOG%"
echo Started: %DATE% %TIME% >> "%LOG%"
REM ---- EDIT THIS ONE LINE ----
setset REPO_URL=https://github.com/gajetoboi123-beep/futuristic-campus-smart-link.git
REM ----------------------------
if "%REPO_URL%"=="https://github.com/YOUR-USERNAME/futuristic-campus-smart-link.git" (
  echo ERROR: Edit 03-connect-github.bat and put your real REPO_URL >> "%LOG%"
  echo Please edit the REPO_URL line first! See tutorial Step 5.
  pause & exit /b 1
)
git init >> "%LOG%" 2>&1
git add . >> "%LOG%" 2>&1
git commit -m "Lesson 2: Futuristic Campus Smart Link Home page" >> "%LOG%" 2>&1
git branch -M main >> "%LOG%" 2>&1
git remote add origin %REPO_URL% >> "%LOG%" 2>&1
git push -u origin main >> "%LOG%" 2>&1
echo DONE. Check %LOG% and your GitHub repo page.
pause
