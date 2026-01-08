
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
