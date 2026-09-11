
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
  "https://github.com/lewis6991/gitsigns.nvim",
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
-- PICKERS, UI-EXTENSIONS & FILE EXPLORERS

-- dependencies
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',       -- for all UI components, including the neo-tree!
  "https://github.com/MunifTanjim/nui.nvim",        -- for backend utilities, such as scanning the filesystem
  "https://github.com/nvim-tree/nvim-web-devicons", -- for icons
}

vim.pack.add {
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',     -- classical file tree
    version = vim.version.range('3')
  },
  'https://github.com/stevearc/oil.nvim',                       -- buffer-like file explorer, default over neo-tree
  'https://github.com/nvim-telescope/telescope.nvim',           -- picker list engine
  'https://github.com/nvim-telescope/telescope-ui-select.nvim', -- extension to override vim.ui.select to use telescope pickers
  -- 'nvim-telescope/telescope-fzf-native.nvim',
}

require("config.oil")
require("config.neo-tree")
require("config.telescope")

--------------------------------------------------------------------------------
-- LANGUAGE-SPECIFIC LSP CONFIGURATIONS

vim.pack.add {
  "https://github.com/mfussenegger/nvim-jdtls",  -- Java
  "https://github.com/folke/lazydev.nvim",       -- NeoVim LuaLS config
}

require("lazydev").setup {
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
}
