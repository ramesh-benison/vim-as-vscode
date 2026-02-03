#!/bin/bash

# ============================================================================
# Vim VSCode Enhanced - Installation Script
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}Vim VSCode Enhanced - Installation${NC}"
echo -e "${GREEN}======================================${NC}"
echo ""

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    echo -e "${RED}Error: Vim is not installed.${NC}"
    echo "Please install Vim first:"
    echo "  Ubuntu/Debian: sudo apt install vim"
    echo "  Fedora: sudo dnf install vim"
    echo "  Arch: sudo pacman -S vim"
    exit 1
fi

# Check Vim version
VIM_VERSION=$(vim --version | head -n1 | grep -oP '\d+\.\d+' | head -n1)
echo -e "${GREEN}✓${NC} Vim version: $VIM_VERSION"

# Backup existing configuration
if [ -f ~/.vimrc ]; then
    echo -e "${YELLOW}Backing up existing .vimrc to ~/.vimrc.backup${NC}"
    cp ~/.vimrc ~/.vimrc.backup
fi

if [ -d ~/.vim ]; then
    echo -e "${YELLOW}Backing up existing .vim directory to ~/.vim.backup${NC}"
    cp -r ~/.vim ~/.vim.backup
fi

# Create necessary directories
echo -e "${GREEN}Creating directories...${NC}"
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/undodir

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Install vim-plug
echo -e "${GREEN}Installing vim-plug plugin manager...${NC}"
cp "$PROJECT_DIR/config/vimrc" ~/.vimrc
cp  "$PROJECT_DIR/scripts/plug.vim"" ~/.vim/autoload/plug.vim

# Copy vimrc
echo -e "${GREEN}Installing vimrc configuration...${NC}"
cp "$PROJECT_DIR/config/vimrc" ~/.vimrc

# Copy coc-settings.json
echo -e "${GREEN}Installing CoC settings...${NC}"
mkdir -p ~/.vim
cp "$PROJECT_DIR/config/coc-settings.json" ~/.vim/coc-settings.json

# Install plugins
echo -e "${GREEN}Installing Vim plugins...${NC}"
vim +PlugInstall +qall

# Check for Node.js (required for CoC)
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}Warning: Node.js is not installed.${NC}"
    echo "Node.js is required for Language Server features (CoC.nvim)."
    echo "Please install Node.js 14+ from: https://nodejs.org/"
    echo ""
else
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✓${NC} Node.js version: $NODE_VERSION"
fi

# Check for Python 3
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}Warning: Python 3 is not installed.${NC}"
    echo "Python 3 is recommended for some plugins."
else
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✓${NC} Python version: $PYTHON_VERSION"
fi

# Check for Git
if ! command -v git &> /dev/null; then
    echo -e "${YELLOW}Warning: Git is not installed.${NC}"
else
    GIT_VERSION=$(git --version)
    echo -e "${GREEN}✓${NC} Git version: $GIT_VERSION"
fi

# Check for fzf
if ! command -v fzf &> /dev/null; then
    echo -e "${YELLOW}Notice: fzf is not installed.${NC}"
    echo "Installing fzf for fuzzy finding..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# Check for ripgrep (for faster searching)
if ! command -v rg &> /dev/null; then
    echo -e "${YELLOW}Notice: ripgrep is not installed.${NC}"
    echo "Ripgrep provides faster file searching. To install:"
    echo "  Ubuntu/Debian: sudo apt install ripgrep"
    echo "  Fedora: sudo dnf install ripgrep"
    echo "  Arch: sudo pacman -S ripgrep"
fi

# Check for ctags
if ! command -v ctags &> /dev/null; then
    echo -e "${YELLOW}Warning: ctags is not installed.${NC}"
    echo "Ctags is required for tag generation and code navigation."
    echo "To install Universal Ctags:"
    echo "  Ubuntu/Debian: sudo apt install universal-ctags"
    echo "  Fedora: sudo dnf install ctags"
    echo "  Arch: sudo pacman -S ctags"
    echo "  macOS: brew install universal-ctags"
else
    CTAGS_VERSION=$(ctags --version | head -n1)
    echo -e "${GREEN}✓${NC} Ctags version: $CTAGS_VERSION"
fi

# Check for cscope (optional)
if ! command -v cscope &> /dev/null; then
    echo -e "${YELLOW}Notice: cscope is not installed (optional).${NC}"
    echo "Cscope provides advanced navigation for C/C++ projects."
    echo "To install:"
    echo "  Ubuntu/Debian: sudo apt install cscope"
    echo "  Fedora: sudo dnf install cscope"
    echo "  Arch: sudo pacman -S cscope"
    echo "  macOS: brew install cscope"
else
    CSCOPE_VERSION=$(cscope --version 2>&1 | head -n1)
    echo -e "${GREEN}✓${NC} Cscope: installed"
fi

# Create tags cache directory
echo -e "${GREEN}Creating tags cache directory...${NC}"
mkdir -p ~/.cache/tags

echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "${GREEN}======================================${NC}"
echo ""
echo "Next steps:"
echo "1. Install a Nerd Font for icons: https://www.nerdfonts.com/"
echo "2. Configure your terminal to use the Nerd Font"
echo "3. Open Vim and the plugins will be installed automatically"
echo "4. Install language servers (run: ./scripts/install-language-servers.sh)"
echo ""
echo "Optional CoC extensions to install (in Vim):"
echo "  :CocInstall coc-json coc-tsserver coc-html coc-css"
echo "  :CocInstall coc-python coc-prettier coc-eslint"
echo "  :CocInstall coc-snippets coc-pairs"
echo ""
echo "Key bindings:"
echo "  <Space>e  - Toggle file explorer"
echo "  <Space>ff - Find files"
echo "  <Space>fg - Find in files"
echo "  <Ctrl-n>  - Toggle terminal"
echo "  gd        - Go to definition"
echo "  K         - Show documentation"
echo ""
echo -e "${GREEN}Happy Vimming! 🚀${NC}"
