return require('packer').startup(function(use)

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end}

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                {
                    mode = "n", -- NORMAL mode
                    -- prefix: use "<leader>f" for example for mapping everything related to finding files
                    -- the prefix is prepended to every mapping part of `mappings`
                    prefix = "",
                    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                    silent = true, -- use `silent` when creating keymaps
                    noremap = true, -- use `noremap` when creating keymaps
                    nowait = false, -- use `nowait` when creating keymaps
                    expr = false, -- use `expr` when creating keymaps
                }
            }
        end
    }

    use 'nvim-tree/nvim-web-devicons'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "rebelot/kanagawa.nvim"

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('nvim-treesitter/playground')

    use('mbbill/undotree')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },           -- Required
            { 'williamboman/mason.nvim' },         -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },   -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },   -- Required
        }
    }

    use {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    }

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' Apps',
                            group = 'DiagnosticHint',
                            action = 'Telescope app',
                            key = 'a',
                        },
                        {
                            desc = ' dotfiles',
                            group = 'Number',
                            action = 'Telescope dotfiles',
                            key = 'd',
                        },
                    },
                    footer = {"bla"},
                },
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

end)
