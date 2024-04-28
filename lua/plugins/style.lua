return {
  { "ellisonleao/gruvbox.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
 ⣠⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡄⣄⠀⠀⠀⠀
⠀⠀⠀⢂⠏⡴⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣜⠳⡍⢢⠁⠀⠀⠀
⠀⠀⠀⠈⠘⡔⣫⢞⣤⣶⣾⣶⣿⣿⣷⣶⣶⣿⣿⣶⣿⣶⣍⡣⢈⠆⠁⠀⠀⠀
⠀⠀⠀⠀⠘⣽⠿⠿⠿⣿⣯⣿⡿⣯⢿⣿⣿⣿⡯⢜⡱⢫⣿⠷⠯⣄⠀⠀⠀⠀
⠀⠀⠀⠀⢸⣽⠀⠀⡀⠀⠉⢷⣿⣿⣿⣿⣿⡿⣽⢪⣝⠋⡀⠀⠀⠸⠄⠀⠀⠀
⠀⠀⠀⢠⣾⠇⠀⠀⠀⠀⠀⣀⠻⣿⣿⣿⣿⣿⣽⣧⢇⠀⠀⠀⠀⠈⣆⠀⠀⠀
⠀⠀⠀⣿⢿⣿⣦⣤⣤⣤⣶⣿⣷⣻⣟⣿⣿⣿⣿⣾⣏⡳⢶⣤⣴⣴⡣⠆⠀⠀
⠀⠀⢀⣯⣟⣿⣿⣿⣿⣿⣿⣿⣿⣷⣯⡟⣿⢻⠟⢷⠛⠝⠫⣟⠿⣭⡓⠆⠀⠀
⠀⠀⠀⣿⣾⣟⡾⣽⢻⣿⣿⣿⣿⣿⠳⠉⠆⢉⠈⠄⠂⠈⠀⢈⣿⣲⠹⠀⠀⠀
⠀⠀⠀⣿⣷⣏⣞⡽⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⣈⡷⣭⢳⡄⠀⠀
⠀⠀⠀⣿⣿⣾⡽⣾⣿⣿⠿⡿⢛⠏⢯⡙⠲⡀⠀⠀⠀⢀⠰⡈⡑⠎⡹⠀⠀⠀
⠀⣠⣾⣿⣿⣿⣿⣿⣏⣏⠳⡑⢊⠜⠠⠈⠁⠐⠀⠀⠀⠀⠂⠐⠀⠂⠡⠁⠀⠀
⢠⣿⣿⣿⣿⣿⣿⣿⣿⣮⡱⣀⠂⡈⠀⠠⠀⠀⠀⠀⠀⠀⢀⠀⠀⠈⠀⠀⠀⠀
⣾⣿⣿⣿⣿⣿⣿⣿⣿⣳⢿⡱⢃⠤⠁⡀⠀⠀⠀⠀⢀⠈⢀⠈⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣟⡻⣝⠞⣭⠲⡉⢋⠤⢁⠀⠈⠀⠄⠁⠀⠀⡀⠠⠀     
            ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },
}
