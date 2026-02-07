vim.treesitter.start()

vim.api.nvim_create_user_command("PySetup", function()
  vim.cmd("!pip install 'python-lsp-server[all]' black autopep8 ruff")
end, {})

vim.keymap.set("n", "<leader>c", function()
  vim.cmd(string.format("split | term ipython -i '%s'", vim.fn.expand('%:p')))
end)
