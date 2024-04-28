-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("autocmd BufNewFile,BufRead *.py set filetype=python")
