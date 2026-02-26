vim.treesitter.start()

vim.keymap.set("n", "<leader>c", function()
  vim.cmd(string.format("split | term ipython -i '%s'", vim.fn.expand('%:p')))
end)
