@echo off
echo ========================================================
echo   REDAI Temporary Server Setup (Ngrok Ready)
echo ========================================================

echo.
echo [1/2] Building Frontend for Production...
cd front
call npm run build
if %errorlevel% neq 0 (
    echo Frontend build failed! Please check errors above.
    pause
    exit /b %errorlevel%
)
cd ..

echo.
echo [2/2] Starting Unified Server (Frontend + Backend)...
echo.
echo Server will run on http://localhost:10000
echo.
echo INSTRUCTIONS FOR NGROK:
echo 1. Open a NEW terminal window.
echo 2. Run command: ngrok http 10000
echo 3. Share the generated https URL with others.
echo.
echo Starting server now...
python wsgi.py
pause
