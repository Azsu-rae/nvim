
-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[silent! %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight when yanking (copying) text",
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end
})
