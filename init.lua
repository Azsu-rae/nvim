
-- vimscript global variables --

-- see :help mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disables the default file tree.
-- see :help netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- set to true if you have a nerd font installed in the terminal that runs neovim
vim.g.have_nerd_font = true

-- namespaces --

-- see :help vim.fn
Vimscript = vim.fn

-- see :help vim.fs
Filesystem = vim.fs

-- frequently used functions --

-- see :help filename-modifiers & fnamemodify()
FilepathTransform = Vimscript.fnamemodify

-- see :help glob() & wildcards
MatchPattern = Vimscript.glob

-- constants --

PROJECTS_DIR = "C:\\Users\\Ait Ameur\\Projects"
OS = vim.loop.os_uname().sysname

-- frequently accessed fields --

Cashe = {}
Cashe.datapath = Vimscript.stdpath("data")
Cashe.pluginpath = Cashe.datapath .. "/site/pack/packer/start"
Cashe.packerpath = Cashe.pluginpath .. "/packer.nvim"
Cashe.bootstrap = (Vimscript.empty(MatchPattern(Cashe.packerpath)) == 1)
Cashe.colorscheme = {repo="rebelot/kanagawa.nvim", name="kanagawa", ref="/kanagawa.nvim"}

-- configuration --

-- neovim editor options
require 'options'

-- keymaps and autocmds
require 'keymaps'
require 'autocmds'

-- plugins configuration
require 'plugin.setup'

