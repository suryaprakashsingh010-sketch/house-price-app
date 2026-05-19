@echo off
cd /d "%~dp0"
start "Flask Server" cmd /k python app.py

echo.
echo Waiting for server to start...
:loop
timeout /t 2 /nobreak >nul
curl -s http://127.0.0.1:5000/api/health >nul 2>&1
if errorlevel 1 goto loop

echo.
echo Server is ready at http://127.0.0.1:5000
echo.
pause

