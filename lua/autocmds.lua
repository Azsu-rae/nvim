
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
