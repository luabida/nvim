return {
  {
    "kiyoon/jupynium.nvim",
    build = "m --no-capture-output -n jupynium pip install .",
    enabled = vim.fn.isdirectory(vim.fn.expand("~/micromamba/envs/jupynium")),
  },
  "rcarriga/nvim-notify", -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
