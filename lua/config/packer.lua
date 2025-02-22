
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
            'nvim-telescope/telescope-ui-select.nvim'   -- UI Select extension
        },
    }

end)

-- Activating the OneDark color scheme
vim.cmd('colorscheme darkplus')

require 'config.plugins.lualine'
require 'config.plugins.treesitter'
require 'config.plugins.nvim-tree'
require 'config.plugins.telescope'




