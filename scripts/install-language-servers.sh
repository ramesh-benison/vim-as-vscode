#!/bin/bash

# ============================================================================
# Language Server Installation Script
# Install common language servers for various programming languages
# ============================================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Installing Language Servers...${NC}"
echo ""

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}Error: Node.js is required but not installed.${NC}"
    echo "Installing Node.js 14+ from: https://nodejs.org/"
    # Download and install nvm:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    # in lieu of restarting the shell
    \. "$HOME/.nvm/nvm.sh"

    # Download and install Node.js:
    nvm install 24

    # Verify the Node.js version:
    node -v # Should print "v24.13.0".

    # Verify npm version:
    npm -v # Should print "11.6.2".
fi

echo -e "${GREEN}Node.js found: $(node --version)${NC}"
echo ""

# Function to install npm package globally
install_npm_package() {
    local package=$1
    local description=$2
    
    echo -e "${YELLOW}Installing $description...${NC}"
    if npm install -g "$package"; then
        echo -e "${GREEN}✓ $description installed${NC}"
    else
        echo -e "${RED}✗ Failed to install $description${NC}"
    fi
    echo ""
}
# Clang support
install_npm_package "clang-format" "clang-format support"

# JavaScript/TypeScript
install_npm_package "typescript" "TypeScript"
install_npm_package "typescript-language-server" "TypeScript Language Server"

# HTML/CSS/JSON
install_npm_package "vscode-langservers-extracted" "HTML/CSS/JSON Language Servers"

# Python (requires pip)
if command -v pip3 &> /dev/null; then
    echo -e "${YELLOW}Installing Python Language Server...${NC}"
    if pip3 install --user python-lsp-server; then
        echo -e "${GREEN}✓ Python Language Server installed${NC}"
    else
        echo -e "${RED}✗ Failed to install Python Language Server${NC}"
    fi
    echo ""
    
    # Optional: Install additional Python tools
    echo -e "${YELLOW}Installing Python linters and formatters...${NC}"
    pip3 install --user pylint black autopep8 flake8
    echo ""
else
    echo -e "${YELLOW}pip3 not found. Skipping Python Language Server.${NC}"
    echo "Install Python and pip3 to enable Python support."
    echo ""
fi

# Bash
install_npm_package "bash-language-server" "Bash Language Server"

# Docker
install_npm_package "dockerfile-language-server-nodejs" "Docker Language Server"

# YAML
install_npm_package "yaml-language-server" "YAML Language Server"

# Go (requires Go to be installed)
if command -v go &> /dev/null; then
    echo -e "${YELLOW}Installing Go Language Server...${NC}"
    if go install golang.org/x/tools/gopls@latest; then
        echo -e "${GREEN}✓ Go Language Server (gopls) installed${NC}"
    else
        echo -e "${RED}✗ Failed to install Go Language Server${NC}"
    fi
    echo ""
else
    echo -e "${YELLOW}Go not found. Skipping Go Language Server.${NC}"
    echo "Install Go from https://golang.org/ to enable Go support."
    echo ""
fi

# Rust (requires Rust to be installed)
if command -v cargo &> /dev/null; then
    echo -e "${YELLOW}Installing Rust Language Server...${NC}"
    if rustup component add rust-analyzer; then
        echo -e "${GREEN}✓ Rust Analyzer installed${NC}"
    else
        echo -e "${RED}✗ Failed to install Rust Analyzer${NC}"
    fi
    echo ""
else
    echo -e "${YELLOW}Rust/Cargo not found. Skipping Rust Language Server.${NC}"
    echo "Install Rust from https://rustup.rs/ to enable Rust support."
    echo ""
fi

echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}Language Server Installation Complete${NC}"
echo -e "${GREEN}======================================${NC}"
echo ""
echo "Installed language servers for:"
echo "  ✓ Clang"
echo "  ✓ JavaScript/TypeScript"
echo "  ✓ HTML/CSS/JSON"
echo "  ✓ Bash"
echo "  ✓ Docker"
echo "  ✓ YAML"

if command -v pip3 &> /dev/null; then
    echo "  ✓ Python"
fi

if command -v go &> /dev/null; then
    echo "  ✓ Go"
fi

if command -v cargo &> /dev/null; then
    echo "  ✓ Rust"
fi

echo ""
echo "Next steps:"
echo "1. Restart Vim"
echo "2. Language servers will activate automatically for supported file types"
echo "3. Use <Space>ca for code actions, gd for go-to-definition, etc."
echo ""
