
require('nvim-treesitter.configs').setup {
    ensure_installed = {'java', 'lua', 'python', 'r', 'cpp', 'c', 'latex'},
    highlight = {
        enable = true, -- Enable Treesitter for highlighting
        additional_vim_regex_highlighting = true, -- Disable fallback Vim regex-based highlighting
        disable = {'nvim-tree'},
    },
    indent = {
        enable = true, -- Enable Treesitter for indentation
        disable = {'lua'}, -- As of today, treesitter has trouble with lua indentation. Lucky for us, Neovim has a default LSP for lua installed which is used by default
    },
    autotag = {
        enable = true,
    },
}
