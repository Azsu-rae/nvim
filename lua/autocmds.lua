
vim.api.nvim_create_autocmd("FileType", {
  pattern = require("languages").twospace_indent,
  callback = function()
    vim.bo.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = require("languages").filetypes,
  callback = function()
    vim.treesitter.start()
  end
})

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})
