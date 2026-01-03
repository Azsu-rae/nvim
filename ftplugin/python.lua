
vim.treesitter.start()

vim.keymap.set("n", "<leader>c", function()
  vim.cmd(string.format("split | term ipython -i '%s'", vim.fn.expand('%:p')))
end)

vim.keymap.set("n", "<leader>r", function()

  local file_path = vim.fn.expand("%:p")
  local file_name = vim.fn.fnamemodify(file_path, ":t:r")

  local directory_path = vim.fn.fnamemodify(file_path, ":h")
  local directory_name = vim.fn.fnamemodify(file_path, ":h:t")

  if vim.uv.fs_stat("./run.sh") ~= nil then
    vim.cmd("split | term ./run.sh")
  elseif vim.fn.getcwd() == directory_path then
    vim.cmd("split | term " .. string.format("python -m %s", file_name))
  else
    vim.cmd("split | term " .. string.format("python -m %s.%s", directory_name, file_name))
  end
end)

vim.keymap.set("n", "<leader>vi", function()
  vim.cmd("split | term tree -I __pycache__")
end, { desc = "[Vi]sualize directory structure"})

