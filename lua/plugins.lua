
--------------------------------------------------------------------------------
-- MANAGING PACKAGES (LSPs, Treesitter Parsers, ...)

vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",
}

require("nvim-treesitter").install(require("languages").treesitters)
require("mason").setup()

--------------------------------------------------------------------------------
-- TEXT EDITING

vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/windwp/nvim-autopairs",
}

require("nvim-autopairs").setup {}

--------------------------------------------------------------------------------
-- UTILTIES (Git, Terminals, ...)

vim.pack.add {
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/akinsho/toggleterm.nvim",
}

require("toggleterm").setup {
  open_mapping = "<C-\\>",
  direction = "float",
}

--------------------------------------------------------------------------------
-- VISUAL AID

vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
}

require("ibl").setup {
  scope = {
    enabled = true,
    -- char = 'k',
  },
}

--------------------------------------------------------------------------------
-- PICKERS, UI-EXTENSIONS & FILE EXPLORER

vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  -- 'nvim-telescope/telescope-fzf-native.nvim',
}

require("config.oil")
require("config.telescope")

--------------------------------------------------------------------------------
-- LANGUAGE-SPECIFIC CONFIGURATIONS

vim.pack.add {
  "https://github.com/mfussenegger/nvim-jdtls", -- Java
  "https://github.com/folke/lazydev.nvim"       -- NeoVim LuaLS config
}

require("lazydev").setup {
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
}
