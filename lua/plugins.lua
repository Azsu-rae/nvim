-- text editing
vim.pack.add {
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/kylechui/nvim-surround",
}

require("nvim-autopairs").setup {}

-- utilties
vim.pack.add {
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/akinsho/toggleterm.nvim",
}

require("toggleterm").setup {
  open_mapping = "<C-\\>",
  direction = "float",
}

-- treesitter plugins
vim.pack.add {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
}

require("nvim-treesitter").install(require("languages").treesitter)

-- installing LSPs
vim.pack.add {
  "https://github.com/mason-org/mason.nvim",
}

require("mason").setup()

-- specific language plugins
vim.pack.add {
  -- java
  "https://github.com/mfussenegger/nvim-jdtls",
  -- NeoVim luaLS config
  "https://github.com/folke/lazydev.nvim"
}

require("lazydev").setup({
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
})

require("config.oil")
