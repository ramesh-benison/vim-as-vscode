# Vim VSCode Enhanced

A modern Vim configuration that brings VSCode-like features to the Linux Vim editor, combining the power and efficiency of Vim with the convenience of modern IDE features.

## Overview

This project transforms Vim into a powerful development environment with features commonly found in VSCode, including:

- **IntelliSense & Auto-completion**: Smart code completion powered by language servers
- **File Explorer**: Tree-style file navigation sidebar
- **Fuzzy Finding**: Quick file and content search
- **Git Integration**: Visual git diff, status, and blame annotations
- **Syntax Highlighting**: Enhanced syntax highlighting for multiple languages
- **Linting & Error Detection**: Real-time code analysis and error highlighting
- **Multiple Cursors**: Edit multiple locations simultaneously
- **Terminal Integration**: Built-in terminal window
- **Status Line**: Informative status bar with git branch, file info, and more
- **Snippet Support**: Code snippets and templates
- **Color Themes**: Modern color schemes similar to VSCode
- **Ctags & Cscope**: Automatic tag generation and advanced code navigation

## Features

### Code Intelligence
- LSP (Language Server Protocol) integration via `coc.nvim` or `vim-lsp`
- Auto-completion with context-aware suggestions
- Go to definition, find references, and symbol search
- Inline documentation and signature help

### File Management
- NERDTree or netrw for file exploration
- Fuzzy file finder with fzf or CtrlP
- Quick buffer and window navigation

### Git Integration
- Fugitive for git commands
- GitGutter for diff indicators in the gutter
- Git blame annotations

### Enhanced Editing
- Multiple cursor support via vim-multiple-cursors
- Smart indentation and auto-formatting
- Bracket and quote auto-pairing
- Comment toggling shortcuts

### Code Navigation (Ctags & Cscope)
- Automatic tag generation with gutentags
- Jump to definitions and declarations
- Find symbol references across the codebase
- Function call hierarchy navigation
- Find callers and callees
- Search for files and includes
- Background tag regeneration on save

### Visual Enhancements
- Airline or Lightline status bar
- Modern color schemes (Gruvbox, One Dark, Dracula, etc.)
- Icon support with vim-devicons
- Smooth scrolling

## Installation

### Prerequisites

- Vim 8.0+ or Neovim 0.5+
- Git
- Node.js (for LSP features)
- Python 3 (for some plugins)
- A Nerd Font (for icons)
- Exuberant Ctags or Universal Ctags (for tag generation)
- Cscope (optional, for advanced C/C++ navigation)

### Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/vim-vscode-enhanced.git ~/.vim-vscode-enhanced

# Run the installation script
cd ~/.vim-vscode-enhanced
./scripts/install.sh
```

### Manual Installation

1. Back up your existing Vim configuration:
   ```bash
   mv ~/.vimrc ~/.vimrc.backup
   mv ~/.vim ~/.vim.backup
   ```

2. Copy the configuration:
   ```bash
   cp config/vimrc ~/.vimrc
   ```

3. Install vim-plug (plugin manager):
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. Open Vim and install plugins:
   ```bash
   vim +PlugInstall +qall
   ```

5. Install language servers (optional, for LSP features):
   ```bash
   ./scripts/install-language-servers.sh
   ```

## Configuration

### Main Configuration File

The main configuration is in `config/vimrc`. Key sections include:

- **General Settings**: Basic Vim options
- **Plugin Configuration**: Plugin-specific settings
- **Key Mappings**: Custom keyboard shortcuts
- **Color Scheme**: Visual appearance settings

### Custom Plugins

Add your own plugins by editing the plugin section in `config/vimrc`:

```vim
call plug#begin('~/.vim/plugged')
" Add your plugins here
Plug 'your-username/your-plugin'
call plug#end()
```

### Key Mappings

Common keybindings (Leader key is Space):

- `<Space>e` - Toggle file explorer
- `<Space>ff` - Fuzzy find files
- `<Space>fg` - Fuzzy find in files (grep)
- `<Space>bb` - List buffers
- `<Ctrl-n>` - Toggle terminal
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `<Space>rn` - Rename symbol
- `<Space>]` - Jump to tag (ctags)
- `<Space>[` - Jump back from tag
- `<Space>cs` - Find symbol (cscope)
- `<Space>cg` - Find definition (cscope)
- `<Space>cc` - Find callers
- `<Space>rt` - Regenerate tags manually

## Plugin List

Core plugins included:

- **vim-plug**: Plugin manager
- **coc.nvim**: Conquer of Completion (LSP client)
- **nerdtree**: File explorer
- **fzf.vim**: Fuzzy finder
- **vim-fugitive**: Git integration
- **vim-gitgutter**: Git diff in gutter
- **vim-airline**: Status bar
- **vim-devicons**: File icons
- **auto-pairs**: Auto-close brackets
- **vim-commentary**: Easy commenting
- **gruvbox**: Color scheme
- **vim-gutentags**: Automatic tag management
- **gutentags_plus**: Cscope integration

See `config/vimrc` for the complete list.

## Ctags and Cscope

This configuration includes automatic tag generation and advanced code navigation with ctags and cscope.

For detailed usage instructions, see [CTAGS_CSCOPE_GUIDE.md](docs/CTAGS_CSCOPE_GUIDE.md).

**Quick Start:**
- Tags are automatically generated when you open or save files
- Press `<Space>]` to jump to definition
- Press `<Space>cs` to find all symbol references
- Press `<Space>cc` to find function callers
- Press `<Space>rt` to manually regenerate tags

## Customization

### Changing Color Scheme

Edit `config/vimrc` and change the colorscheme line:

```vim
colorscheme gruvbox  " Change to your preferred scheme
```

### Adding Language Support

Install the appropriate language server and configure it in `coc-settings.json` or your LSP configuration.

### Adjusting Key Mappings

Modify the key mapping section in `config/vimrc` to suit your preferences.

## Troubleshooting

### Plugins Not Working

```bash
# Reinstall plugins
vim +PlugClean +PlugInstall +qall
```

### LSP Features Not Working

```bash
# Check Node.js version (should be 14+)
node --version

# Reinstall coc.nvim extensions
vim +CocInstall +qall
```

### Icons Not Displaying

Install a Nerd Font and configure your terminal to use it.

### Tags Not Generated

```bash
# Install ctags (Universal Ctags recommended)
# Ubuntu/Debian
sudo apt install universal-ctags

# Fedora
sudo dnf install ctags

# macOS
brew install universal-ctags

# Install cscope (for C/C++ projects)
sudo apt install cscope  # Ubuntu/Debian
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The Vim community for excellent plugins
- VSCode for inspiration
- All contributors and plugin authors

## Support

For issues, questions, or suggestions, please open an issue on GitHub.

---

**Happy Vimming! 🚀**
