# One-Click Install Script for Claude Sales Expert
# Run this in PowerShell as Administrator

param(
    [switch]$SkipInstall,
    [switch]$JustRun
)

$ErrorActionPreference = "Continue"
$script:failed = $false

function Write-Step {
    param([string]$Message)
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host " $Message" -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan
}

function Test-Command {
    param([string]$Cmd)
    $null = Get-Command $Cmd -ErrorAction SilentlyContinue
    return $?
}

function Install-Bun {
    Write-Host "Installing Bun..." -ForegroundColor Yellow
    powershell -ExecutionPolicy Bypass -c "irm bun.sh/install.ps1 | iex"
    $env:BUN_INSTALL = "$env:USERPROFILE\.bun"
    $env:PATH = "$env:BUN_INSTALL\bin;$env:PATH"
}

function Install-Rust {
    Write-Host "Installing Rust..." -ForegroundColor Yellow
    powershell -ExecutionPolicy Bypass -c "irm https://sh.rustup.rs | iex"
    # Source rustup environment
    $rustupPath = "$env:USERPROFILE\.cargo\bin"
    if (Test-Path $rustupPath) {
        $env:PATH = "$rustupPath;$env:PATH"
    }
}

# ============================================
# MAIN SCRIPT
# ============================================

Write-Host @"

╔═══════════════════════════════════════════════════════════╗
║     Claude Sales Expert - One Click Installer            ║
║     AI-Powered Lead Research & Qualification              ║
╚═══════════════════════════════════════════════════════════╝
"@ -ForegroundColor Green

# Step 1: Check/Install Bun
Write-Step "Step 1: Checking Bun..."
if (Test-Command "bun") {
    Write-Host "✓ Bun is already installed ($((bun --version)))" -ForegroundColor Green
} else {
    Write-Host "✗ Bun not found. Installing..." -ForegroundColor Yellow
    Install-Bun
    # Reload PATH for this session
    $env:BUN_INSTALL = "$env:USERPROFILE\.bun"
    $env:PATH = "$env:BUN_INSTALL\bin;$env:PATH"
    if (Test-Command "bun") {
        Write-Host "✓ Bun installed successfully ($((bun --version)))" -ForegroundColor Green
    } else {
        Write-Host "✗ Failed to install Bun. Please restart PowerShell and try again." -ForegroundColor Red
        $script:failed = $true
    }
}

# Step 2: Check/Install Rust
Write-Step "Step 2: Checking Rust..."
if (Test-Command "rustc") {
    Write-Host "✓ Rust is already installed ($(rustc --version))" -ForegroundColor Green
} else {
    Write-Host "✗ Rust not found. Installing..." -ForegroundColor Yellow
    Install-Rust
    # Reload PATH for this session
    $rustupPath = "$env:USERPROFILE\.cargo\bin"
    if (Test-Path $rustupPath) {
        $env:PATH = "$rustupPath;$env:PATH"
    }
    if (Test-Command "rustc") {
        Write-Host "✓ Rust installed successfully ($(rustc --version))" -ForegroundColor Green
    } else {
        Write-Host "✗ Failed to install Rust. Please restart PowerShell and try again." -ForegroundColor Red
        $script:failed = $true
    }
}

# Step 3: Clone or Update Repository
Write-Step "Step 3: Setting up Repository..."
$repoDir = "$PSScriptRoot\..\claude-sales-expert"
if (-not (Test-Path $repoDir)) {
    Write-Host "Cloning repository..." -ForegroundColor Yellow
    git clone https://github.com/sidehero/claude-sales-expert.git $repoDir
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Failed to clone repository" -ForegroundColor Red
        $script:failed = $true
    }
} else {
    Write-Host "Repository already exists. Pulling latest..." -ForegroundColor Yellow
    Set-Location $repoDir
    git pull origin master
}

Set-Location $repoDir

# Step 4: Install Dependencies
Write-Step "Step 4: Installing Dependencies..."
if (-not $script:failed) {
    Write-Host "Running: bun install" -ForegroundColor Yellow
    bun install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Failed to install dependencies" -ForegroundColor Red
        $script:failed = $true
    } else {
        Write-Host "✓ Dependencies installed successfully" -ForegroundColor Green
    }
}

# Step 5: Build & Run
Write-Step "Step 5: Building & Running..."
if (-not $script:failed) {
    Write-Host @"

========================================
 Installation Complete!
========================================

Run the app with:
    bun run tauri:dev

Or build for production:
    bun run tauri:build

========================================
"@ -ForegroundColor Green
    
    # Ask user what they want to do
    Write-Host "What would you like to do?" -ForegroundColor Cyan
    Write-Host "  [1] Build & Run (auto-launch .exe)"
    Write-Host "  [2] Run in development mode"
    Write-Host "  [3] Just build (no launch)"
    Write-Host "  [4] Open folder in Explorer"
    Write-Host "  [Q] Quit`n" -ForegroundColor Gray
    
    $choice = Read-Host "Enter choice [1]"
    
    $exePath = "$repoDir\src-tauri\target\release\claude-sales-expert.exe"
    $desktopPath = "$env:USERPROFILE\Desktop\Claude Sales Expert.exe"
    
    switch ($choice) {
        "1" {
            Write-Host "Building for production..." -ForegroundColor Yellow
            bun run tauri:build
            
            if (Test-Path $exePath) {
                Write-Host "`nCopying .exe to Desktop..." -ForegroundColor Cyan
                Copy-Item $exePath $desktopPath -Force
                Write-Host "✓ Copied to Desktop" -ForegroundColor Green
                
                Write-Host "Launching app..." -ForegroundColor Yellow
                Start-Process $desktopPath
                Write-Host "✓ App launched!" -ForegroundColor Green
            } else {
                Write-Host "✗ Build failed or .exe not found" -ForegroundColor Red
            }
        }
        "2" {
            Write-Host "Starting development server..." -ForegroundColor Yellow
            bun run tauri:dev
        }
        "3" {
            Write-Host "Building for production..." -ForegroundColor Yellow
            bun run tauri:build
            Write-Host "`nBuild complete! Executable location:" -ForegroundColor Green
            Write-Host "  src-tauri\target\release\Claude Sales Expert.exe" -ForegroundColor Cyan
        }
        "4" {
            explorer.exe $repoDir
        }
        default {
            Write-Host "Building for production..." -ForegroundColor Yellow
            bun run tauri:build
            
            if (Test-Path $exePath) {
                Write-Host "`nCopying .exe to Desktop..." -ForegroundColor Cyan
                Copy-Item $exePath $desktopPath -Force
                Write-Host "✓ Copied to Desktop" -ForegroundColor Green
                
                Write-Host "Launching app..." -ForegroundColor Yellow
                Start-Process $desktopPath
                Write-Host "✓ App launched!" -ForegroundColor Green
            }
        }
    }
} else {
    Write-Host @"

========================================
 Installation Had Errors!
========================================

Please check the errors above and try again.
You can also manually run these commands:

    cd claude-sales-expert
    bun install
    bun run tauri:dev

========================================
"@ -ForegroundColor Red
}