@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo  Claude Sales Expert - Installer
echo ========================================
echo.

REM Check if Bun is installed
where bun >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Bun not found. Installing...
    powershell -ExecutionPolicy Bypass -c "irm bun.sh/install.ps1 | iex"
    if %ERRORLEVEL% neq 0 (
        echo ERROR: Failed to install Bun
        echo Please install Bun manually from https://bun.sh
        pause
        exit /b 1
    )
    echo Bun installed. Please restart this script.
    pause
    exit /b 0
)

echo ✓ Bun found: 
bun --version

REM Check if Rust is installed
where rustc >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Rust not found. Installing...
    powershell -ExecutionPolicy Bypass -c "irm https://sh.rustup.rs | iex"
    if %ERRORLEVEL% neq 0 (
        echo ERROR: Failed to install Rust
        echo Please install Rust manually from https://rustup.rs
        pause
        exit /b 1
    )
    echo Rust installed. Please restart this script.
    pause
    exit /b 0
)

echo ✓ Rust found: 
rustc --version

REM Check if Claude Code is installed (REQUIRED)
echo.
echo ========================================
echo  Step 3: Checking Claude Code...
echo ========================================
where claude >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo ════════════════════════════════════════════════════════════
    echo  WARNING: Claude Code is REQUIRED to run this app!
    echo ════════════════════════════════════════════════════════════
    echo.
    echo Please install from: https://claude.ai/code
    echo Then authenticate with: claude auth
    echo.
    echo After installing Claude Code, run this script again.
    echo ════════════════════════════════════════════════════════════
    pause
    exit /b 1
)
echo ✓ Claude Code found

echo.

REM Clone or update repository
if not exist "claude-sales-expert" (
    echo Cloning repository...
    git clone https://github.com/sidehero/claude-sales-expert.git
    if %ERRORLEVEL% neq 0 (
        echo ERROR: Failed to clone repository
        pause
        exit /b 1
    )
    cd claude-sales-expert
) else (
    echo Updating repository...
    cd claude-sales-expert
    git pull origin master
)

REM Install dependencies
echo.
echo Installing dependencies...
bun install
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ========================================
echo  Installation Complete!
echo ========================================
echo.
echo Options:
echo   [1] Build & Run (auto-launch .exe to Desktop)
echo   [2] Run in development mode
echo   [3] Just build (no launch)
echo   [4] Open folder in Explorer
echo.
set /p choice="Enter choice [1]: "

if "%choice%"=="1" goto :build_and_run
if "%choice%"=="2" goto :dev
if "%choice%"=="3" goto :just_build
if "%choice%"=="4" goto :open_folder
if "%choice%"=="" goto :build_and_run
goto :build_and_run

:build_and_run
echo Building for production...
call bun run tauri:build
if %ERRORLEVEL% neq 0 (
    echo ERROR: Build failed
    pause
    goto :end
)
echo.
echo Copying .exe to Desktop...
copy /Y "src-tauri\target\release\claude-sales-expert.exe" "%USERPROFILE%\Desktop\Claude Sales Expert.exe"
echo ✓ Copied to Desktop
echo.
echo Launching app...
start "" "%USERPROFILE%\Desktop\Claude Sales Expert.exe"
echo ✓ App launched!
pause
goto :end

:dev
echo Starting development mode...
bun run tauri:dev
goto :end

:just_build
echo Building for production...
bun run tauri:build
echo.
echo Build complete! Executable is in:
echo   src-tauri\target\release\claude-sales-expert.exe
pause
goto :end

:open_folder
explorer.exe .
goto :end

:quit
echo Goodbye!
goto :end

:end