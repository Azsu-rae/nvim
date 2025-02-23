
-- Ensure packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

    --------------------------------- LSP & DEBUGGING PLUGINS: THESE ARE ALL DEPENDENT ON EACH OTHER ---------------------------------

    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "saadparwaiz1/cmp_luasnip", -- feed luasnip suggestions to cmp
            "rafamadriz/friendly-snippets",  -- provide vscode like snippets to cmp
        }
    }

    use {
        'hrsh7th/nvim-cmp',          -- Completion engine
        requires = {
            'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',    -- Buffer words completion
            'hrsh7th/cmp-path',      -- Filesystem paths completion
            'hrsh7th/cmp-cmdline',   -- Command-line completion
            'L3MON4D3/LuaSnip',      -- Snippet engine
            'saadparwaiz1/cmp_luasnip', -- Snippet completion
        }
    }

    -- To configure the Neovim LSP Client, which is installed by default (It is what Neovim will use to communicate with the LSPs)
    use 'neovim/nvim-lspconfig'

    -- Neovim Debug Adapter Protocole. It is what Neovim will use to communicate with debuggers
    use {
        'mfussenegger/nvim-dap',
        requires = {
            -- ui plugins to make debugging simplier
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
    }

    -- Package manager to install LSPs and Debuggers
    use 'williamboman/mason.nvim'

    -- Configure mason when it comes to LSPs
    use 'williamboman/mason-lspconfig.nvim'

    -- Configure mason when it comes to Debuggers
    use 'jay-babu/mason-nvim-dap.nvim'

    -- Java LSP integration (independent of nvim-lspconfig, directly configures Neovim's LSP Client with JDTLS (the java LSP))
    use 'mfussenegger/nvim-jdtls'

end)

-- Activating the OneDark color scheme
vim.cmd('colorscheme darkplus')

-- Utility plugins
require 'plugins.lualine'
require 'plugins.treesitter'
require 'plugins.nvim-tree'
require 'plugins.telescope'

-- LSP & Debugging plugins
require 'plugins.cmp'
require 'plugins.lspconfig'
require 'plugins.nvim-dap'

-- Mason plugins
require 'plugins.mason'
require 'plugins.mason-lspconfig'
require 'plugins.mason-nvim-dap'
