# Plugins Directory

This directory is reserved for custom plugin configurations and additions.

## Adding Custom Plugins

To add your own plugins to the Vim VSCode Enhanced setup:

1. Edit `config/vimrc` and add your plugin in the vim-plug section:
   ```vim
   call plug#begin('~/.vim/plugged')
   " ... existing plugins ...
   Plug 'username/plugin-name'
   call plug#end()
   ```

2. Open Vim and run:
   ```
   :PlugInstall
   ```

3. Add any plugin-specific configuration below the plugin declaration in the `vimrc` file.

## Custom Configuration Files

You can also place custom Vim configuration files in this directory and source them from your main `vimrc`:

```vim
source ~/.vim-vscode-enhanced/plugins/my-custom-config.vim
```

## Recommended Additional Plugins

Here are some additional plugins you might want to consider:

- **nvim-lspconfig**: Alternative LSP configuration for Neovim
- **telescope.nvim**: Highly customizable fuzzy finder (Neovim)
- **nvim-cmp**: Completion plugin for Neovim
- **vim-easymotion**: Fast navigation with motion keys
- **vim-bookmarks**: Bookmark lines and navigate
- **vim-tmux-navigator**: Seamless navigation between Vim and tmux
- **tagbar**: Display tags in a sidebar
- **ultisnips**: Advanced snippet engine
- **ale**: Asynchronous linting engine (alternative to CoC diagnostics)
