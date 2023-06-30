local plugins = {
  -- neovim-qt
  {"equalsraf/neovim-qt"},
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   opts = function ()
  --     return require "custom.configs.ChatGPT"
  --   end,
  -- },
  -- vim-unimpaired
  {"tpope/vim-unimpaired", lazy = false},
  -- surround
  { 'tpope/vim-surround', lazy = false },
  -- vim-fugitive
  {'tpope/vim-fugitive', lazy = false},
  -- telescope-conda
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'IllustratedMan-code/telescope-conda.nvim'
    },
    config = function (_, opts)
      require("core.utils").load_mappings("conda_envs")
    end,
  },
  -- persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  -- -- tokyonight theme
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  -- dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
 ██████╗ ██╗██████╗  █████╗⚒️ 
 ██╔══██╗██║██╔══██╗██╔══██╗
 ██████╔╝██║██║  ██║███████║
 ██╔══██╗██║██║  ██║██╔══██║
 ██████╔╝██║██████╔╝██║  ██║
 ╚═════╝ ╚═╝╚═════╝ ╚═╝  ╚═╝
     ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", "🔎" .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", "📄" .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "📃" .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", "🎯" .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "⚙️" .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "📤" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "😴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", "❌" .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "🌙 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
  -- notify
  {
    'rcarriga/nvim-notify',
    lazy = false,
  },
  -- move
  {
   "fedepujol/move.nvim",
    lazy = false,
  },
  -- debugger ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  -- DEBUGGING 
  -- nvim-dap 
  {
    "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },
  -- debugger python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
      -- python
      "pyright",
      "mypy",
      "ruff",
      "black",
      "debugpy",
      -- rust
      "rust-analyzer",
      }
    },
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
