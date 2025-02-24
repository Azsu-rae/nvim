
-- Ensure packer is installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

-- Packer configuration
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim' -- Packer manages itself
    use 'lunarvim/darkplus.nvim' -- Colorscheme

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- Treesitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- nvim-tree for directory navigation and managing
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Optional icons
        },
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',                    -- A necessary dependency
            'nvim-telescope/telescope-ui-select.nvim',   -- UI Select extension
        },
    }

    -- Autocompletion plugins
    use {
        'hrsh7th/nvim-cmp',          -- Completion engine
        requires = {
            'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',    -- Buffer words completion
            'hrsh7th/cmp-path',      -- Filesystem paths completion
            'hrsh7th/cmp-cmdline',   -- Command-line completion
            'L3MON4D3/LuaSnip',      -- Snippet engine
            'saadparwaiz1/cmp_luasnip', -- Snippet completion
            "rafamadriz/friendly-snippets",  -- provide vscode like snippets to cmp
        }
    }

    -- To configure the Neovim LSP Client, which is installed by default (It is what Neovim will use to communicate with the LSPs)
    use 'neovim/nvim-lspconfig'

    -- Java LSP (jdtls) configuration plugin (independent of nvim-lspconfig, directly configures Neovim's LSP Client with JDTLS)
    use 'mfussenegger/nvim-jdtls'

    -- Neovim Debug Adapter Protocole. It is what Neovim will use to communicate with debuggers
    use {
        'mfussenegger/nvim-dap',
        requires = {
            -- ui plugins to make debugging simplier
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
    }

    -- Package manager for LSPs and Debuggers
    use 'williamboman/mason.nvim'

    -- Configure mason when it comes to LSPs
    use 'williamboman/mason-lspconfig.nvim'

    -- Configure mason when it comes to Debuggers
    use 'jay-babu/mason-nvim-dap.nvim'

end)

-- Activating the OneDark color scheme
vim.cmd('colorscheme darkplus')

-- Utility plugins
require 'plugins.util.lualine'
require 'plugins.util.treesitter'
require 'plugins.util.nvim-tree'
require 'plugins.util.telescope'

-- Autocompletion, LSP & Debugging plugins
require 'plugins.cmp.nvim-cmp'
require 'plugins.lsp.lspconfig'
require 'plugins.dap.nvim-dap'

-- Mason plugins
require 'plugins.mason.mason'
require 'plugins.mason.mason-lspconfig'
require 'plugins.mason.mason-nvim-dap'
