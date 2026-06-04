#!/bin/bash
# One-Click Install Script for Claude Sales Expert
# Run this in Terminal

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}========================================"
echo -e " Claude Sales Expert Installer"
echo -e "========================================${NC}"

# Check if Bun is installed
if ! command -v bun &> /dev/null; then
    echo -e "${YELLOW}Installing Bun...${NC}"
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
else
    echo -e "${GREEN}✓ Bun already installed${NC}"
fi

# Check if Rust is installed
if ! command -v rustc &> /dev/null; then
    echo -e "${YELLOW}Installing Rust...${NC}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo -e "${GREEN}✓ Rust already installed${NC}"
fi

# Reload PATH
export PATH="$HOME/.bun/bin:$HOME/.cargo/bin:$PATH"

# Check if Claude Code is installed (REQUIRED)
echo -e "${CYAN}========================================"
echo -e " Step 3: Checking Claude Code..."
echo -e "========================================${NC}"

if ! command -v claude &> /dev/null; then
    echo ""
    echo -e "${YELLOW}╔═══════════════════════════════════════════════════════════╗"
    echo -e "║  WARNING: Claude Code is REQUIRED to run this app!          ║"
    echo -e "╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Please install from: https://claude.ai/code"
    echo "Then authenticate with: claude auth"
    echo ""
    echo "After installing Claude Code, run this script again."
    exit 1
fi
echo -e "${GREEN}✓ Claude Code found${NC}"

# Check for Homebrew (for WebKit dependencies on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew &> /dev/null; then
        echo -e "${YELLOW}Installing WebKit dependencies...${NC}"
        brew install webkit2gtk-4.1 gtk+3 libsoup-3.0 javascriptcoregtk-4.1 gdk-pixbuf-2.0 pango atk 2>/dev/null || true
    else
        echo -e "${YELLOW}Warning: Homebrew not found. Install WebKit dependencies manually if build fails.${NC}"
    fi
fi

# Clone or update repo
if [ -d "claude-sales-expert" ]; then
    echo -e "${YELLOW}Updating existing installation...${NC}"
    cd claude-sales-expert
    git pull
else
    echo -e "${YELLOW}Cloning repository...${NC}"
    git clone https://github.com/sidehero/claude-sales-expert.git
    cd claude-sales-expert
fi

# Install dependencies
echo -e "${YELLOW}Installing dependencies...${NC}"
bun install

# Ask what to do
echo ""
echo -e "${CYAN}========================================"
echo -e " Installation Complete!"
echo -e "========================================${NC}"
echo ""
echo "Choose an option:"
echo "  1) Build & Run (auto-launch app)"
echo "  2) Run in development mode"
echo "  3) Just build (no launch)"
echo "  4) Open project folder"
echo "  5) Exit"
echo ""
read -p "Enter option (1-5): " choice

case $choice in
    1)
        echo -e "${GREEN}Building for production...${NC}"
        bun run tauri:build
        
        APP_PATH="src-tauri/target/release/claude-sales-expert.app"
        if [ -d "$APP_PATH" ]; then
            echo ""
            echo -e "${CYAN}Copying to Applications...${NC}"
            cp -R "$APP_PATH" /Applications/
            echo -e "${GREEN}✓ Copied to /Applications${NC}"
            
            echo -e "${CYAN}Launching app...${NC}"
            open /Applications/"Claude Sales Expert.app"
            echo -e "${GREEN}✓ App launched!${NC}"
        else
            echo -e "${RED}Build failed or app not found${NC}"
        fi
        ;;
    2)
        echo -e "${GREEN}Starting development mode...${NC}"
        bun run tauri:dev
        ;;
    3)
        echo -e "${GREEN}Building for production...${NC}"
        bun run tauri:build
        ;;
    4)
        open .
        ;;
    *)
        echo "Exiting..."
        ;;
esac