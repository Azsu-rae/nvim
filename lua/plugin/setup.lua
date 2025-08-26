
if Cashe.bootstrap then
    Vimscript.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", Cashe.packerpath
    }
    vim.o.runtimepath = Cashe.packerpath .. "," .. vim.o.runtimepath
end

local packer = require('packer')

local function plugins(use)

    -- BASIC NEOVIM PLUGINS:    package manager, colorscheme, status line, syntax highlighting, --
    --                          file tree and search interface                                  --

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Treesitter for syntax highlighting
    use "nvim-treesitter/nvim-treesitter"

    -- Colorscheme
    use {
        Cashe.colorscheme.repo,
    }

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
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
            "nvim-telescope/telescope-ui-select.nvim", -- UI Select extension
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- For faster sorting
                run = 'make',
            },
        },
    }

    -- CODE EDITING UTILITIES: autocompletion, code analysis, diagnostics and debugging --

    -- Autocompletion plugins
    use {
        "hrsh7th/nvim-cmp", -- Completion engine
        requires = {
            -- sources of nvim-cmp
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- Buffer words completion
            "hrsh7th/cmp-path",         -- Filesystem paths completion
            "hrsh7th/cmp-cmdline",      -- Command-line completion
            "petertriho/cmp-git",       -- Git completion

            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- bridge between LuaSnip and nvim-cmp (acts as a source to nvim-cmp)

            "rafamadriz/friendly-snippets", -- provide vscode like snippets to luasnip

            "ray-x/lsp_signature.nvim", -- For function signature display (nothing 
                                        -- to do with nvim-cmp it just fits nicely here)

            "onsails/lspkind.nvim",     -- Small plugin for vscode-like pictograms for
                                        -- nvim-cmp to use in formatting it's suggestions
        },
    }

    -- confguring Neovim's LSP Client with various Language Servers
    use "neovim/nvim-lspconfig"

    -- directly configures Neovim's LSP Client with eclipse.jdt.ls
    use "mfussenegger/nvim-jdtls"

    -- Neovim Debug Adapter Protocole. It is what Neovim will use to communicate with debuggers
    use {
        "mfussenegger/nvim-dap",
        requires = {
            -- ui plugins to make debugging simplier
--            "rcarriga/nvim-dap-ui",
--            "nvim-neotest/nvim-nio",
--            "theHamsta/nvim-dap-virtual-text",
        },
    }

    -- Package manager for LSPs and Debuggers
    use "williamboman/mason.nvim"

    -- Configure mason when it comes to LSPs
    use "williamboman/mason-lspconfig.nvim"

    -- Configure mason when it comes to Debuggers
    use "jay-babu/mason-nvim-dap.nvim"

    -- USEFUL TOOLS --

    -- configures the lua language server for the neovim config environment
    use "folke/lazydev.nvim"

    -- Deep buffer integration for Git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
        end,
    }
end

-- Packer configuration
packer.startup(plugins)

if Cashe.bootstrap or Cashe.newcolorscheme then
    packer.sync()
    return
end

vim.cmd.colorscheme(Cashe.colorscheme.name)

-- Neovim plugins
require 'plugin.nvim.lualine'
require 'plugin.nvim.nvim-tree'
require 'plugin.nvim.telescope'
require 'plugin.nvim.treesitter'

-- Editor utilities (completion, LSPs for code analysis and debugging)
require 'plugin.editor.cmp'
require 'plugin.editor.lsp'
require 'plugin.editor.dap'
