
local M = {}

local packerpath = vim.fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
Bootstrap = vim.fn.empty(vim.fn.glob(packerpath)) == 1

if Bootstrap then
    vim.fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", packerpath
    }
    vim.opt.runtimepath:prepend(packerpath)
end

local function plugins(use)

    -- package manager --
    use "wbthomason/packer.nvim"

    -- Text Editing: colorscheme, file tree, status line, file picker, syntax highlighting --

    -- colorscheme
    use {
        "fcpg/vim-fahrenheit",
        config = function()
            vim.cmd.colorscheme("fahrenheit")
        end,
        run = function()

            -- neovim colorscheme background in haxadecimal
            local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
            local bg = string.format("#%06x", hl.bg)

            local path = "C:\\Users\\a50055268\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"
            local file = vim.fn.readfile(path)
            local json_str = table.concat(file, "\n")
            local term_config = vim.fn.json_decode(json_str)
            local current_colorscheme = term_config.profiles.defaults.colorScheme
            for i, scheme in ipairs(term_config.schemes) do
                if scheme.name == current_colorscheme then
                    print(term_config.schemes[i].background)
                    print(bg)
                    term_config.schemes[i].background = bg
                    print(term_config.schemes[i].background)
                    print(bg)
                end
            end
            local newjson = vim.fn.json_encode(term_config)
            vim.fn.writefile(vim.split(newjson, "\n"), path)
        end,
    }

    -- file tree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- for icons
        },
        config = function()
            require('plugins.edit.nvim-tree').setup()
        end,
    }

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            --- @diagnostic disable-next-line: missing-parameter
            require('lualine').setup()
        end,
    }

    -- dependencie: Telescope extension that replaces Telescope’s default Lua
    -- sorter with a native (C-compiled) FZF-style sorter.
    -- No config needed. Will be loaded by telescope
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = 'make',
    }

    -- generic fuzzy-finding framework used for: file picker, text search in files, ...
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- general purpose lua utility library for Nvim
        },
        config = function()
            require('plugins.edit.telescope').setup()
        end,
    }

    -- treesitter parsers & query files manager. It also configures them with Nvim
    -- for: syntax highlighting, folding, ... (anything requiring a parser)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.edit.treesitter').setup()
        end,
    }

    -- Development: autocompletion,
    --              code snippets,
    --              code analysis for real-time diagnostics
    --              Navigation actions: go to definition, references, etc.
    --              Refactor actions: rename, extract function, etc.
    --              Code actions: quick fixes and other context-sensitive edits.

    use {
        "L3MON4D3/LuaSnip", -- Snippet engine
        requires = {
            "saadparwaiz1/cmp_luasnip",     -- bridge between LuaSnip and nvim-cmp (acts as a source to nvim-cmp)
            "rafamadriz/friendly-snippets", -- provide vscode-like snippets to luasnip
        },
        config = function ()
            require('plugins.dev.luasnip').setup()
        end
    }

    -- For function signature display
    use {
        "ray-x/lsp_signature.nvim",
        config = function ()
            require('plugins.dev.lsp_signature').setup()
        end
    }

    use {
        "hrsh7th/nvim-cmp", -- Completion engine
        requires = {
            -- sources of nvim-cmp
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- Buffer words completion
            "hrsh7th/cmp-path",         -- Filesystem paths completion
            "hrsh7th/cmp-cmdline",      -- Command-line completion

            "onsails/lspkind.nvim",     -- Small plugin for vscode-like pictograms for
                                        -- nvim-cmp to use in formatting it's suggestions
        },
        config = function()
            require('plugins.dev.nvim-cmp').setup()
        end,
    }

    use {
        "neovim/nvim-lspconfig", -- collection of default configs for language servers
        requires = {
            "williamboman/mason.nvim", -- package manager of language servers and debuggers
            "williamboman/mason-lspconfig.nvim", -- configures mason for language servers
        },
        config = function()
            require('plugins.dev.lspconfig').setup()
        end,
    }

    -- debugger
    use {
        'mfussenegger/nvim-dap',
        config= function ()
            require('plugins.dev.nvim-dap').setup()
        end
    }

    -- Utilities --

    -- configures the lua language server for the neovim config environment
    use {
        "folke/lazydev.nvim",
        config = function ()
            require('plugins.util.lazydev').setup()
        end
    }

    -- indentation --
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require('plugins.util.ibl').setup()
        end
    }

    -- Deep buffer integration for Git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('plugins.util.gitsigns').setup()
        end,
    }

    -- Interactive Repl Over Neovim
    use {
        "Vigemus/iron.nvim",
        config = function ()
            require('plugins.util.iron')
        end
    }

    -- Language specific plugins --

    -- directly configures Neovim's LSP Client with eclipse.jdt.ls
    use "mfussenegger/nvim-jdtls"

    -- filetype plugin for LaTeX files
    use "lervag/vimtex"

    -- better spell checking
--    use "barreiroleo/ltex-extra.nvim"
end

M.setup = function()
    local packer = require('packer')
    packer.startup(plugins)
    if Bootstrap then
        packer.sync()
    end
end

return M
