
vim.keymap.set("n", "<leader>r", function()
  local file_path = vim.fn.expand('%s')
  local file_name = vim.fn.fnamemodify(file_path, ':t:r')
  vim.cmd(string.format('!typst compile "%s"', file_path))
  vim.cmd(string.format('!wslview %s.pdf', file_name))
end)
