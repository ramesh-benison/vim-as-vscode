# Ctags and Cscope Guide

This guide explains how to use ctags and cscope for powerful code navigation in Vim VSCode Enhanced.

## Overview

### Ctags
Ctags creates an index (tag file) of language objects found in source files, allowing you to quickly navigate to definitions, functions, variables, and more.

### Cscope
Cscope is an interactive tool designed for C/C++ code navigation. It builds a database that allows you to find:
- Function definitions and calls
- Variable usage
- File includes
- Text patterns

### Gutentags
This configuration uses `vim-gutentags` and `gutentags_plus` to automatically manage tags and cscope databases in the background.

## Installation

### Install Ctags

**Ubuntu/Debian:**
```bash
sudo apt install universal-ctags
```

**Fedora/RHEL:**
```bash
sudo dnf install ctags
```

**Arch Linux:**
```bash
sudo pacman -S ctags
```

**macOS:**
```bash
brew install universal-ctags
```

**From Source:**
```bash
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
```

### Install Cscope (Optional)

**Ubuntu/Debian:**
```bash
sudo apt install cscope
```

**Fedora/RHEL:**
```bash
sudo dnf install cscope
```

**Arch Linux:**
```bash
sudo pacman -S cscope
```

**macOS:**
```bash
brew install cscope
```

## How It Works

### Automatic Tag Generation

Gutentags automatically generates tags when you:
1. Open a file in a project (detected by `.git`, `.root`, `.project`, etc.)
2. Save a file
3. Create a new file

Tags are stored in `~/.cache/tags/` to keep your project clean.

### Project Root Detection

Gutentags detects project root by looking for these markers:
- `.git`
- `.hg`
- `.svn`
- `.root`
- `.project`

You can create a `.root` file in any directory to mark it as a project root:
```bash
touch .root
```

## Ctags Key Bindings

### Basic Navigation

| Key Binding | Action | Description |
|------------|--------|-------------|
| `<Space>]` | Jump to tag | Jump to the definition of symbol under cursor |
| `<Space>[` | Jump back | Return to previous location |
| `<C-]>` | Jump to tag | Standard Vim tag jump (alternative) |
| `<C-t>` | Pop tag | Return from tag jump (alternative) |

### Tag Management

| Key Binding | Action | Description |
|------------|--------|-------------|
| `<Space>ts` | Show tag stack | Display the tag navigation history |
| `<Space>rt` | Regenerate tags | Manually trigger tag regeneration |
| `<Space>ti` | Show tag info | Display information about tag under cursor |

### Advanced Tag Navigation

**Split window navigation:**
- `<C-w>]` - Open tag in horizontal split
- `<C-w>}` - Preview tag in preview window

**Tag selection:**
- `:ts <tag>` - List all tags matching `<tag>`
- `:tag <tag>` - Jump to `<tag>`

## Cscope Key Bindings

All cscope commands use the `<Space>c` prefix:

| Key Binding | Action | Description |
|------------|--------|-------------|
| `<Space>cs` | Find symbol | Find all references to the symbol |
| `<Space>cg` | Find definition | Find global definition |
| `<Space>cc` | Find callers | Find functions calling this function |
| `<Space>cd` | Find callees | Find functions called by this function |
| `<Space>ct` | Find text | Find this text string |
| `<Space>ce` | Find egrep pattern | Find this egrep pattern |
| `<Space>cf` | Find file | Find this file |
| `<Space>ci` | Find includers | Find files that include this file |
| `<Space>ca` | Find assignments | Find places where symbol is assigned |

## Usage Examples

### Example 1: Navigate to Function Definition

1. Place cursor on a function call
2. Press `<Space>]` or `<C-]>`
3. Vim jumps to the function definition
4. Press `<Space>[` or `<C-t>` to return

### Example 2: Find All References to a Variable

1. Place cursor on a variable name
2. Press `<Space>cs` (cscope find symbol)
3. A quickfix list opens showing all references
4. Navigate with `:cn` (next) and `:cp` (previous)

### Example 3: Explore Function Call Hierarchy

1. Place cursor on a function name
2. Press `<Space>cc` to find all callers
3. Navigate to a caller
4. Press `<Space>cd` to find what that function calls
5. Build a mental map of the call hierarchy

### Example 4: Find File Includes

1. Place cursor on a filename in an `#include` statement
2. Press `<Space>cf` to jump to that file
3. Or press `<Space>ci` to see all files that include the current file

### Example 5: Manual Tag Regeneration

If you've made significant changes and want to update tags immediately:
1. Press `<Space>rt`
2. Wait for "Regenerating tags..." message
3. Tags are rebuilt in the background

## Configuration

### Excluded Files

The following file types and directories are excluded from tag generation:
- Build artifacts (`build/`, `dist/`, `bin/`)
- Dependencies (`node_modules/`, `vendor/`, `bower_components/`)
- Documentation (`docs/`, `*.md`)
- Compiled files (`*.pyc`, `*.class`, `*.o`)
- Media files (`*.png`, `*.jpg`, `*.mp3`, etc.)
- Archives (`*.zip`, `*.tar.gz`, etc.)

### Custom Configuration

Edit `config/vimrc` to customize gutentags:

```vim
" Change cache directory
let g:gutentags_cache_dir = expand('~/my-custom-tags-dir')

" Add custom ctags arguments
let g:gutentags_ctags_extra_args += ['--my-custom-flag']

" Add custom project root markers
let g:gutentags_project_root += ['.mymarker']

" Exclude additional patterns
let g:gutentags_ctags_exclude += ['mypattern']
```

## Troubleshooting

### Tags Not Generated

**Check if ctags is installed:**
```bash
ctags --version
```

**Check if gutentags is active:**
In Vim, run:
```vim
:echo gutentags#statusline()
```

**Manually trigger tag generation:**
Press `<Space>rt` or run:
```vim
:GutentagsUpdate!
```

### Cscope Not Working

**Check if cscope is installed:**
```bash
cscope --version
```

**Verify gutentags modules:**
In Vim, run:
```vim
:echo g:gutentags_modules
```
Should show: `['ctags', 'cscope']`

**Check for cscope database:**
```bash
ls ~/.cache/tags/
```
Look for `cscope.out` files.

### Wrong Project Root

If gutentags is using the wrong project root:

1. Create a `.root` file in your desired project root:
   ```bash
   touch /path/to/project/.root
   ```

2. Or set it manually:
   ```vim
   :let g:gutentags_project_root = ['/path/to/project']
   ```

### Tag Jump Goes to Wrong Location

This can happen with common names. Use tag selection:
```vim
:ts <tagname>
```
This lists all matching tags, allowing you to choose the correct one.

### Performance Issues

If tag generation is slow on large projects:

1. **Exclude more files:**
   ```vim
   let g:gutentags_ctags_exclude += ['large_dir/*']
   ```

2. **Disable automatic generation:**
   ```vim
   let g:gutentags_generate_on_write = 0
   ```
   Then manually regenerate with `<Space>rt`

3. **Use only ctags (disable cscope):**
   ```vim
   let g:gutentags_modules = ['ctags']
   ```

## Tips and Best Practices

### 1. Use Preview Window
Preview a tag without leaving your current location:
```vim
:ptag <tagname>
```
Or with keyboard: `<C-w>}`

### 2. Navigate Tag Stack
View your navigation history:
```vim
:tags
```

### 3. Search Tags with Patterns
Find tags matching a pattern:
```vim
:tag /pattern
```

### 4. Multiple Matches
When multiple tags match, use:
- `:tn` - Next match
- `:tp` - Previous match
- `:ts` - List all matches

### 5. Project-Specific Exclusions
Create `.gutentags` in your project root:
```
--exclude=specific_dir
--exclude=*.tmp
```

### 6. Combine with FZF
Search tags with fuzzy finding:
```vim
:Tags
```

### 7. Use Telescope (Neovim)
For Neovim users, Telescope provides enhanced tag searching:
```vim
:Telescope tags
```

## Language-Specific Notes

### C/C++
- Cscope works best with C/C++ code
- Use `<Space>cc` and `<Space>cd` for call hierarchy
- Include paths are automatically detected

### Python
- Ctags indexes classes, functions, and methods
- Cscope has limited support
- Consider using LSP (CoC) for better Python navigation

### JavaScript/TypeScript
- Ctags supports modern JS/TS syntax
- Use LSP for better type-aware navigation
- Combine both for comprehensive navigation

### Go
- Ctags supports Go structures and functions
- Use `gopls` (LSP) as primary navigation
- Ctags as fallback for quick local navigation

## Advanced Usage

### Custom Tag Commands

Create custom commands in your vimrc:

```vim
" Jump to tag in vertical split
nnoremap <Leader>v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Jump to tag in new tab
nnoremap <Leader>t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
```

### Script Integration

Generate tags via script:
```bash
#!/bin/bash
# generate-tags.sh
ctags -R --fields=+niazS --extra=+q .
cscope -Rb
```

### Multiple Tag Files

Use tags from multiple projects:
```vim
set tags=./tags,tags,/path/to/other/project/tags
```

## Resources

- [Universal Ctags](https://github.com/universal-ctags/ctags)
- [Cscope](http://cscope.sourceforge.net/)
- [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
- [gutentags_plus](https://github.com/skywind3000/gutentags_plus)

## See Also

- Use `:help tags` in Vim for built-in documentation
- Use `:help cscope` for cscope documentation
- Check `README.md` for general project information
