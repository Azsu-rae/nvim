
local windows = vim.uv.os_uname().sysname == "Windows_NT"
local vimrc = "~/.vimrc" and not windows or "~/_vimrc"

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/EdenEast/nightfox.nvim",
})

vim.cmd.colorscheme("carbonfox")
vim.cmd.source(vimrc)

require("nvim-treesitter").install({"lua", "python"})
require("mason").setup()

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

vim.keymap.set("n", "<leader>git", function()

  local commit_message = vim.fn.input("Commit message: ")
  if commit_message == "" then
    vim.notify("Aborted!")
    return
  end

  vim.cmd("split | term git add . && git commit -m '%s' && git push origin main")
end)
