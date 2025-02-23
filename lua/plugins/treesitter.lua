
require('nvim-treesitter.configs').setup {
    ensure_installed = {'java', 'lua', 'python'},
    highlight = {
        enable = true, -- Enable Treesitter for highlighting
        additional_vim_regex_highlighting = false, -- Disable fallback Vim regex-based highlighting
        disable = {'nvim-tree'}
    },
    indent = {
        enable = true -- Enable Treesitter for indentation
    }
}
