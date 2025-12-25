
in_windows = vim.uv.os_uname().sysname == "Windows_NT"

-- Use powershell instead of command prompt
if in_windows then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- Source vim config
local vimrc = "~/.vimrc" and not in_windows or "~/_vimrc"
vim.cmd.source(vimrc)

-- setup plugins
require('plugins')

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

vim.keymap.set("n", "<leader>st", function()
  local win_id = vim.api.nvim_get_current_win()
  vim.cmd("tab split")
  vim.api.nvim_win_close(win_id, true)
end, { desc="[s]plit into a new [t]ab" })

vim.keymap.set("n", "<leader>vi", function()
  vim.cmd("split | term tree")
end)

vim.keymap.set("n", "<leader>git", function()

  local commit_message = vim.fn.input("Commit message: ")
  if commit_message == "" then
    vim.notify("Aborted!")
    return
  end

  vim.cmd("split | term git add . && git commit -m '%s' && git push origin main")
end)
