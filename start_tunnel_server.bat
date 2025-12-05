@echo off
echo ========================================================
echo   REDAI Public Server Setup (Pinggy / Localhost.run)
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
echo ========================================================
echo   INSTRUCTIONS TO EXPOSE TO INTERNET (Choose one)
echo ========================================================
echo.
echo OPTION 1: Pinggy (Recommended - No install)
echo -------------------------------------------
echo Open a NEW terminal and run:
echo ssh -p 443 -R0:localhost:10000 a.pinggy.io
echo.
echo OPTION 2: Localhost.run (Alternative)
echo -------------------------------------
echo Open a NEW terminal and run:
echo ssh -R 80:localhost:10000 localhost.run
echo.
echo ========================================================
echo.
echo Starting server now...
python wsgi.py
pause
