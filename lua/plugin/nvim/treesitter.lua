
require('nvim-treesitter.configs').setup {
    ensure_installed = {'java', 'lua', 'python', 'cpp', 'c', 'latex', 'xml', 'query', 'markdown', 'markdown_inline', 'powershell', 'json'},
    ignore_install = {},
    modules = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = {'nvim-tree'},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- Enable Treesitter for indentation
        disable = {'lua'}, -- As of today, treesitter has trouble with lua indentation. Lucky for us, Neovim has a default LSP for lua installed which is used by default
    },
    autotag = {
        enable = true,
    },
}
