# Key Bindings Quick Reference

Leader key: `<Space>`

## File Navigation

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer (NERDTree) |
| `<Space>ef` | Find current file in NERDTree |
| `<Space>ff` | Fuzzy find files (FZF) |
| `<Space>fg` | Find in files / grep (FZF) |
| `<Space>bb` | List open buffers |
| `<Space>fr` | Recent files |

## Window Management

| Key | Action |
|-----|--------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

## Buffer Management

| Key | Action |
|-----|--------|
| `<Space>bn` | Next buffer |
| `<Space>bp` | Previous buffer |
| `<Space>bd` | Close buffer |

## General

| Key | Action |
|-----|--------|
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>x` | Save and quit |
| `<Space>h` | Clear search highlighting |

## Code Intelligence (LSP / CoC)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Show documentation |
| `<Space>rn` | Rename symbol |
| `<Space>fm` | Format code |
| `<Space>ca` | Code action |
| `<Space>qf` | Quick fix current line |
| `<Tab>` | Trigger completion / next item |
| `<S-Tab>` | Previous completion item |
| `<CR>` | Accept completion |
| `<C-Space>` | Trigger completion manually |

## Ctags Navigation

| Key | Action |
|-----|--------|
| `<Space>]` | Jump to tag definition |
| `<Space>[` | Jump back from tag |
| `<C-]>` | Jump to tag (standard Vim) |
| `<C-t>` | Pop tag stack (standard Vim) |
| `<Space>ts` | Show tag stack |
| `<Space>rt` | Regenerate tags manually |
| `<Space>ti` | Show tag info for word under cursor |

## Cscope Navigation

| Key | Action |
|-----|--------|
| `<Space>cs` | Find symbol (all references) |
| `<Space>cg` | Find global definition |
| `<Space>cc` | Find functions calling this function |
| `<Space>cd` | Find functions called by this function |
| `<Space>ct` | Find text string |
| `<Space>ce` | Find egrep pattern |
| `<Space>cf` | Find file |
| `<Space>ci` | Find files including this file |
| `<Space>ca` | Find assignments to symbol |

## Git Integration

| Key | Action |
|-----|--------|
| `<Space>gs` | Git status |
| `<Space>gd` | Git diff |
| `<Space>gc` | Git commit |
| `<Space>gp` | Git push |
| `<Space>gl` | Git pull |
| `<Space>gb` | Git blame |

## Terminal

| Key | Action |
|-----|--------|
| `<C-n>` | Toggle floating terminal |
| `<C-n>` (in terminal) | Close terminal |

## Commenting

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment (current line) |
| `gc` | Toggle comment (visual mode) |

## Multiple Cursors

| Key | Action |
|-----|--------|
| `<C-n>` | Select word under cursor / next occurrence |
| `<C-p>` | Go back to previous occurrence |
| `<C-x>` | Skip current occurrence |

## Utilities

| Key | Action |
|-----|--------|
| `<Space>tn` | Toggle relative/absolute line numbers |

## Quickfix Navigation

| Command | Action |
|---------|--------|
| `:cn` | Next item in quickfix list |
| `:cp` | Previous item in quickfix list |
| `:copen` | Open quickfix window |
| `:cclose` | Close quickfix window |

## Useful Vim Commands

| Command | Action |
|---------|--------|
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused plugins |
| `:CocInstall <ext>` | Install CoC extension |
| `:CocUninstall <ext>` | Uninstall CoC extension |
| `:CocList extensions` | List CoC extensions |
| `:GutentagsUpdate` | Update tags |
| `:GutentagsUpdate!` | Force regenerate tags |

## Tag Commands

| Command | Action |
|---------|--------|
| `:tag <name>` | Jump to tag |
| `:ts <name>` | List all tags matching name |
| `:tn` | Next tag |
| `:tp` | Previous tag |
| `:tags` | Show tag stack |
| `:Tags` | FZF tag search |

## Tips

### Split Navigation with Tags
- `<C-w>]` - Open tag in horizontal split
- `<C-w>}` - Preview tag in preview window

### Search and Replace
- `:%s/old/new/g` - Replace in entire file
- `:s/old/new/g` - Replace in current line
- `:'<,'>s/old/new/g` - Replace in visual selection

### Marks
- `ma` - Set mark 'a'
- `'a` - Jump to mark 'a'
- `''` - Jump back to previous position

### Macros
- `qa` - Start recording macro in register 'a'
- `q` - Stop recording
- `@a` - Play macro 'a'
- `@@` - Replay last macro

## Resources

- Type `:help <command>` in Vim for detailed help
- See [CTAGS_CSCOPE_GUIDE.md](CTAGS_CSCOPE_GUIDE.md) for ctags/cscope details
- See [README.md](../README.md) for general documentation
