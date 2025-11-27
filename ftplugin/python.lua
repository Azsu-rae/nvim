
vim.keymap.set('n', '<leader>csl', string.format("<cmd>split | term ipython -i %s <cr>", vim.fn.expand("%:p")))

vim.keymap.set('n', '<leader>mm', string.format("<cmd>split | term manim -pqh %s <cr>", vim.fn.expand("%:p")))

vim.o.foldmethod = "expr"   -- or "syntax"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99          -- keep folds open by default
vim.o.foldenable = true       -- enable folding

local runcmds = require('utils.runcmds')
local cmd = {
    compiled = false,
    template = {
        exec = "py %s"
    }
}

vim.keymap.set("n", "<leader>run", function() runcmds.run(cmd) end, {
    buffer=true
})

vim.keymap.set("n", "<leader>rf", function() runcmds.runfile(cmd) end, {
    buffer=true
})
