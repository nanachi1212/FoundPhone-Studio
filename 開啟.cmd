@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Please install Node.js LTS from https://nodejs.org first.
  pause
  exit /b 1
)
if not exist node_modules (
  echo Installing dependencies, first run only...
  call npm install --no-audit --no-fund
  if errorlevel 1 (
    echo npm install failed.
    pause
    exit /b 1
  )
)
start "" /min cmd /c "timeout /t 6 /nobreak >nul & start http://127.0.0.1:5173/"
call npm run dev -- --port 5173 --strictPort
pause
