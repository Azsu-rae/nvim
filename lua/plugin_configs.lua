
-- Ensure packer is installed
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
    vim.cmd.packadd 'packer.nvim'
end

local function plugins(use)

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Colorscheme
    use "Mofiqul/dracula.nvim"

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    }

    -- Treesitter for syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- nvim-tree for directory navigation and managing
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- Optional icons
        },
    }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- A necessary dependency (it's a library that telescope uses, not a user-plugin)
            "nvim-telescope/telescope-ui-select.nvim", -- UI Select extension (I don't know what this is)
            {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}, -- For faster sorting
        },
    }

    -- Autocompletion plugins
    use {
        "hrsh7th/nvim-cmp", -- Completion engine
        requires = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer words completion
            "hrsh7th/cmp-path", -- Filesystem paths completion
            "hrsh7th/cmp-cmdline", -- Command-line completion
            "petertriho/cmp-git", -- Git completion

            "L3MON4D3/LuaSnip", -- Snippet engine (The one configured in nvim-cmp)
            "saadparwaiz1/cmp_luasnip", -- Snippet completions source (doesn't need to be configured)

            "rafamadriz/friendly-snippets", -- provide vscode like snippets to cmp
            "ray-x/lsp_signature.nvim", -- For function signature autocompletion
            "onsails/lspkind.nvim", -- Small plugin for vscode-like pictograms to neovim built-in lsp
        },
    }

    -- To configure the Neovim LSP Client, which is installed by default (It is what Neovim will use to communicate with the LSPs)
    use "neovim/nvim-lspconfig"

    -- Java LSP (jdtls) configuration plugin (independent of nvim-lspconfig, directly configures Neovim's LSP Client with JDTLS)
    use "mfussenegger/nvim-jdtls"

    -- Neovim Debug Adapter Protocole. It is what Neovim will use to communicate with debuggers
    use{
        "mfussenegger/nvim-dap",
        requires = {
            -- ui plugins to make debugging simplier
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
    }

    -- Package manager for LSPs and Debuggers
    use "williamboman/mason.nvim"

    -- Configure mason when it comes to LSPs
    use "williamboman/mason-lspconfig.nvim"

    -- Configure mason when it comes to Debuggers
    use "jay-babu/mason-nvim-dap.nvim"
end

-- Packer configuration
require("packer").startup(plugins)

-- Activating the colorscheme
vim.cmd.colorscheme "dracula"

-- Utility plugins
require "plugin.util.generalities"
require "plugin.util.lualine"
require "plugin.util.treesitter"
require "plugin.util.nvim-tree"
require "plugin.util.telescope"

-- Mason plugins
require "plugin.mason.mason"
require "plugin.mason.mason-lspconfig"
require "plugin.mason.mason-nvim-dap"

-- Autocompletion, LSP & Debugging plugins
require "plugin.cmp.nvim-cmp"
require "plugin.lsp.lspconfig"
require "plugin.dap.nvim-dap"

-- Java LSP config
require "plugin.lsp.nvim-jdtls"
