
vim.pack.add({

  -- treesitter and mason to language-specific parsers, query files, and lsp servers (annoying to do manually)
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",

  -- to make everything prettier
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",

  -- utilities
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("nvim-treesitter").install({"lua", "python"})
require("mason").setup()

require("lualine").setup()
vim.opt.showmode = false

vim.cmd.colorscheme("kanagawa")
if in_windows then
  -- Set terminal background color to be the same as neovim's
  require("utils").SyncWindowsTerminalBackground()
end
