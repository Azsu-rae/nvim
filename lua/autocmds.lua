
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
