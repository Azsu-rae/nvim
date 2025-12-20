
vim.keymap.set("n", "<leader>c", function()
  vim.cmd(string.format("split | term ipython -i '%s'", vim.fn.expand('%:p')))
end)

vim.keymap.set("n", "<leader>r", function()

  local file_path = vim.fn.expand("%:p")
  local file_name = vim.fn.fnamemodify(file_path, ":t:r")

  local directory_path = vim.fn.fnamemodify(file_path, ":h")
  local directory_name = vim.fn.fnamemodify(file_path, ":h:t")

  if vim.fn.getcwd() == directory_path then
    vim.cmd("split | term " .. string.format("python -m %s", file_name))
  else
    vim.cmd("split | term " .. string.format("python -m %s.%s", directory_name, file_name))
  end
end)
