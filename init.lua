
PROJECTS_DIR = "C:\\Users\\a50055268\\Projects"
Colorschemes = {
    {"rose-pine/neovim", "rose-pine"},
    {"uhs-robert/oasis.nvim", "oasis"},
}
vim.cmd.colorscheme(vim.fn.readfile(vim.fn.stdpath('config') .. '/scheme.txt')[1])

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
package.loaded["plugins"] = nil
require('plugins').setup()

-- neovim editor options
package.loaded["options"] = nil
require 'options'

-- keymaps and autocmds
package.loaded["keymaps"] = nil
package.loaded["autocmds"] = nil
require 'keymaps'
require 'autocmds'

package.loaded['specs'] = nil
require 'specs'
