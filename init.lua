
-- constants --

PROJECTS_DIR = "C:\\Users\\a50055268\\Projects"
Colorscheme = "rebelot/kanagawa.nvim"
OS = vim.uv.os_uname().sysname
Installed = {
    SDK = {
        flutter = true,
    },
}

-- vimscript global variables --

-- see :help mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disables the default file tree.
-- see :h nvim-tree-netrw
-- see :help netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- set to true if you have a nerd font installed in the terminal that runs neovim
vim.g.have_nerd_font = true

-- configuration --

-- plugins setup
require('plugins').setup()

-- neovim editor options
require 'options'

-- keymaps and autocmds
require 'keymaps'
require 'autocmds'
