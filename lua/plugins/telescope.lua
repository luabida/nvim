return {
  { "Civitasv/cmake-tools.nvim", lazy = true, opts = { cmake_always_use_terminal = true } },
  "crispgm/telescope-heading.nvim",
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "telescope-fzf-native.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    init = function()
      require("config.telescope_setup")
    end,
    config = function()
      require("config.telescope")
    end,
    cmd = "Telescope",
  },
}
