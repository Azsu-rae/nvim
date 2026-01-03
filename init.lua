
local osinfo = require('osinfo')
vim.cmd.source(osinfo.vimrc)

-- available globally
in_windows = osinfo.in_windows

-- setup plugins
require('config.lazy')

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
