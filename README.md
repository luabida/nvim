# Configuração do Neovim

A modern, feature-rich Neovim configuration powered by [LazyVim](https://github.com/LazyVim/LazyVim) with a [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim) color scheme.

## Table of Contents

- [Features](#features)
- [Quick Start](#quick-start)
- [Keybindings](#keybindings)
- [Plugins](#plugins)
- [Configuration](#configuration)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## Features

### Core Features

| Feature | Description |
|---------|-------------|
| **File Explorer** | [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) - filesystem, buffers, git status, and symbols |
| **Fuzzy Finding** | [Telescope](https://github.com/nvim-telescope/telescope.nvim) with file browser, headings, and fzf integration |
| **Git Integration** | [Git Conflict](https://github.com/akinsho/git-conflict.nvim) for merge conflict resolution |
| **Code Navigation** | [Glance](https://github.com/CRPGOrg/Glance) - definitions, references, type definitions, implementations |
| **Code Outline** | [Aerial](https://github.com/stevearc/aerial.nvim) - LSP/treesitter-powered code outline |
| **Syntax Highlighting** | [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with incremental parsing |
| **Statusline** | [Barbecue](https://github.com/utilyre/barbecue.nvim) with LSP symbols and diagnostics |

### Python Development

- **Jupyter Support**: [Jupynium](https://github.com/kiyoon/jupynium.nvim) for notebook integration
- **LSP**: [pylsp](https://github.com/python-lsp/python-lsp-server) with Jedi autocomplete
- **Linting**: pylint-django, pylint-celery, django-stubs
- **Code Formatting**: pycodestyle (80 char line length)

### UI/UX

- **Notifications**: [Noice](https://github.com/folke/noice.nvim) - modern notification UI
- **Dashboard**: [Dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) with session persistence
- **Snacks**: [snacks.nvim](https://github.com/folke/snacks.nvim) for utilities
- **Color Preview**: [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

### Editor Enhancements

- **Surround**: [nvim-surround](https://github.com/kylechui/nvim-surround) for text objects
- **Move**: [mini.move](https://github.com/echasnovski/mini.move) for moving text
- **Matchup**: [vim-matchup](https://github.com/andymass/vim-matchup) for match highlighting
- **Repeat**: [vim-repeat](https://github.com/tpope/vim-repeat) for dot repeat
- **Inc Rename**: Smart incremental renaming

## Quick Start

### Requirements

- Neovim >= 0.12.0
- A terminal with true color support (24-bit color)
- [Nerd Fonts](https://www.nerdfonts.com/) v3.0+ (recommended)

### Installation

```sh
# 1. Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# 2. Clone this repository
git clone https://github.com/your-username/nvim-config.git ~/.config/nvim

# 3. Launch Neovim (plugins install automatically)
nvim
```

### Python Dependencies

```sh
pip install jedi-language-server 'python-lsp-server[all]' django-stubs pylint-django pylint-celery
```

For Jupyter notebook support, create the `jupynium` environment:
```sh
micromamba create -n jupynium -c conda-forge jupynium
```

## Keybindings

### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save buffer (normal mode) |
| `<ctrl-s>` | Save buffer (insert mode) |
| `<leader>q` | Close buffer |
| `<leader>Q` | Quit Neovim |
| `<leader>d` | Close tab |
| `<tab>` | Next tab |
| `<shift-tab>` | Previous tab |

### Window Navigation

| Key | Action |
|-----|--------|
| `<ctrl-h>` | Move to left window |
| `<ctrl-j>` | Move to bottom window |
| `<ctrl-k>` | Move to top window |
| `<ctrl-l>` | Move to right window |

### File Explorer (Neotree)

| Key | Action |
|-----|--------|
| `<ctrl-n>` | Toggle Neotree |

### Fuzzy Finding (Telescope)

| Key | Action |
|-----|--------|
| `<leader>pf` | Find files |
| `<leader>p/` | Search in files (live grep) |
| `<leader>pb` | Find in buffers |
| `<leader>ph` | Find headings |
| `<leader>pe` | File browser |

### Code Navigation (Glance)

| Key | Action |
|-----|--------|
| `gD` | Go to definitions |
| `gR` | Go to references |
| `gY` | Go to type definitions |
| `gM` | Go to implementations |

### Code Actions

| Key | Action |
|-----|--------|
| `<leader>a` | Toggle Aerial (code outline) |
| `<leader>r` | Rename (IncRename) |
| `<leader><space>f` | Code actions |
| `{` / `}` | Navigate to prev/next aerial item |

### Text Manipulation

| Key | Action |
|-----|--------|
| `<ctrl-y>` | Yank to clipboard (normal mode) |
| `<ctrl-y>` | Yank to clipboard (visual mode) |
| `ys` | Add surround (nvim-surround) |
| `ds` | Delete surround |
| `cs` | Change surround |
| `S` | Surround in visual mode |

### Vim Native

| Key | Action |
|-----|--------|
| `k` / `j` | Line navigation (preserves jumplist) |
| `%` | Matchup match highlighting |
| `//` | Clear search highlight |

## Plugins

### Core Plugins

| Plugin | Description |
|--------|-------------|
| [LazyVim](https://github.com/LazyVim/LazyVim) | Plugin manager and base config |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |

### UI Plugins

| Plugin | Description |
|--------|-------------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) | File browser |
| [telescope-heading.nvim](https://github.com/Civitasv/telescope-heading.nvim) | Find headings |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline |
| [glance.nvim](https://github.com/CRPGOrg/Glance) | LSP preview |
| [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | Statusline |
| [noice.nvim](https://github.com/folke/noice.nvim) | Notifications |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard & utilities |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Startup screen |

### Editor Plugins

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Text surroundings |
| [mini.move](https://github.com/echasnovski/mini.move) | Move text blocks |
| [vim-matchup](https://github.com/andymass/vim-matchup) | Match highlighting |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Color previews |
| [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) | Git conflicts |

### LSP & Language

| Plugin | Description |
|--------|-------------|
| [jupynium.nvim](https://github.com/kiyoon/jupynium.nvim) | Jupyter notebooks |
| [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim) | CMake integration |

## Configuration

### Editor Options

Custom options are defined in `lua/config/options.lua`:

```lua
-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- UI
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.scrolloff = 7

-- Text
vim.opt.textwidth = 100
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Persistence
vim.opt.undofile = true
vim.opt.hidden = true
```

### LSP Configuration

Python LSP is configured in `lua/config/lsp.lua`. To add LSP for other languages, use Mason or create a new plugin file.

### Keybindings

Keybindings are defined in `lua/config/keymaps.lua`. Add your own:

```lua
vim.keymap.set("n", "<leader>x", "<cmd>your_command<cr>", silent)
```

## Customization

### Change Colorscheme

Edit `lua/plugins/style.lua`:

```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "gruvbox",  -- change this
  },
},
```

### Add New Plugins

Create a new file in `lua/plugins/` or use `:Lazy` to browse and install plugins.

### Modify Telescope

Edit `lua/config/telescope_setup.lua` to add custom pickers.

### Change Dashboard Logo

The ASCII cat logo is in `lua/plugins/style.lua`. Replace the `header` variable with your own ASCII art.

## Troubleshooting

### Plugins Not Installing

```sh
# Clear lazy cache and reinstall
:Lazy sync
```

### LSP Not Working

```sh
# Check LSP status
:LspInfo

# Install servers
:Mason
```

### Neotree Not Showing

```sh
# Check for errors
:Neotree
:Messages
```

### Font Issues

Ensure your terminal uses a Nerd Font. Set in your terminal config:
```sh
# iTerm2
iTerm2 > Preferences > Profiles > Text > Font > JetBrainsMono Nerd Font

# Alacritty
font:
  normal:
    family: "JetBrainsMono Nerd Font"
```

## Credits

This configuration is built on top of:
- [LazyVim](https://github.com/LazyVim/LazyVim) by Folke
- [Lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
- All the amazing plugins listed above
