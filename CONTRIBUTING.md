# Contributing to Vim VSCode Enhanced

Thank you for your interest in contributing to Vim VSCode Enhanced! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your Vim version and OS
- Relevant plugin versions

### Suggesting Features

Feature suggestions are welcome! Please include:
- Clear description of the feature
- Use case and benefits
- Possible implementation approach (if known)

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Make your changes
4. Test your changes thoroughly
5. Commit with clear messages
6. Push to your fork
7. Open a Pull Request

### Code Style

- Use consistent indentation (spaces, not tabs in vimrc)
- Add comments for complex configurations
- Follow existing code patterns
- Keep plugin configurations organized by category

### Testing Changes

Before submitting:
1. Test the configuration in a clean Vim environment
2. Ensure plugins install without errors
3. Verify key mappings don't conflict
4. Test on multiple file types if applicable

### Documentation

- Update README.md for new features
- Add comments in vimrc for new settings
- Update key bindings documentation

## Project Structure

```
vim-vscode-enhanced/
├── config/
│   ├── vimrc                 # Main Vim configuration
│   └── coc-settings.json     # CoC LSP settings
├── scripts/
│   ├── install.sh            # Main installation script
│   └── install-language-servers.sh  # LSP installation
├── plugins/
│   └── README.md             # Plugin documentation
├── README.md                 # Main documentation
├── LICENSE                   # MIT License
├── .gitignore               # Git ignore patterns
└── CONTRIBUTING.md          # This file
```

## Development Workflow

1. Clone your fork locally
2. Make changes in your branch
3. Test in a clean environment
4. Commit and push
5. Open PR with description

## Community Guidelines

- Be respectful and constructive
- Help others when possible
- Share knowledge and experiences
- Follow the code of conduct

## Questions?

Feel free to open an issue for questions or discussions.

Thank you for contributing! 🚀
