-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.textwidth = 100
vim.opt.scrolloff = 7
vim.opt.wildignore = { "*.o", "*~", "*.pyc" }
vim.opt.wildmode = "longest,full"
vim.opt.whichwrap:append("<,>,h,l")
vim.opt.inccommand = "nosplit"
-- vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = false
vim.opt.showmode = false
vim.opt.shada = [['20,<50,s10,h,/100]]
vim.opt.hidden = true
vim.opt.shortmess:append("c")
vim.opt.joinspaces = false
vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
vim.opt.updatetime = 100
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.opt.previewheight = 5
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = "/home/bida/.config/nvim/.undo/"
vim.opt.synmaxcol = 500
vim.opt.display = "msgsep"
vim.opt.cursorline = true
vim.opt.colorcolumn = "79"
vim.opt.modeline = false
vim.opt.mouse = "nivh"
vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 400
vim.opt.fillchars = [[vert:│,horiz:─,eob: ]]
vim.opt.switchbuf = "useopen,uselast"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
