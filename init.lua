
local util = require('util')
vim.cmd.source(util.os.vimrc)

-- available globally
in_windows = util.os.in_windows

-- setup plugins
require('config.lazy')
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#F7768E", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#E6C384", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = "#7A88CF", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#A9B1D6", bg = "NONE" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr",   { bg = "NONE", fg = "#54546D", })

-- lsp
vim.lsp.enable({"pylsp", "lua_ls"})
vim.diagnostic.config {
  virtual_text = true
}

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight when yanking (copying) text",
  callback = function ()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 200,
    }
  end
})

vim.keymap.set("n", "<leader>git", function()

  local commit_message = vim.fn.input("Commit message: ")
  if commit_message == "" then
    vim.notify("Aborted!")
    return
  end

  vim.cmd(string.format("split | term git add . && git commit -m '%s' && git push origin main", commit_message))

end, { desc = "Commit and push [git] changes"})

vim.keymap.set("n", "<leader>vi", function()
  vim.cmd("split | term tree --gitignore")
end, { desc = "[Vi]sualize directory structure"})
