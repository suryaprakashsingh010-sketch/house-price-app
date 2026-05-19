@echo off
echo ========================================
echo  PropSense - Starting Server
echo ========================================
echo.

cd /d "%~dp0"

REM Start Flask in a new window that stays open
start "Flask Server" cmd /k python app.py

echo.
echo Waiting for server to start (training 4 ML models)...
echo This may take 10-20 seconds on first run...
echo.

REM Poll every 2 seconds until server responds
:loop
timeout /t 2 /nobreak >nul
curl -s http://127.0.0.1:5000/api/health >nul 2>&1
if errorlevel 1 goto loop

echo Server is ready! Opening browser...
start http://127.0.0.1:5000

echo.
echo ========================================
echo  Website opened successfully!
echo ========================================
echo.
echo If the page shows an error, press F5 to refresh.
echo.
echo To stop the server: Close the "Flask Server" window.
echo.
pause

