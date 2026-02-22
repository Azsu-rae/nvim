vim.keymap.set("n", "<leader>git", function()

  local commit_message = vim.fn.input("Commit message: ")
  if commit_message == "" then
    vim.notify("Aborted!")
    return
  end

  local branch = vim.fn.input("Branch: ")
  if branch == "" then
    vim.notify("Aborted!")
    return
  end

  vim.cmd(string.format("split | term git add . && git commit -m '%s' && git push origin %s", commit_message, branch))
end, { desc = "Commit and push [git] changes" })

vim.keymap.set("n", "<leader>vi", function()
  vim.cmd("split | term tree --gitignore")
end, { desc = "[Vi]sualize directory structure" })

vim.keymap.set("n", "<leader>r", function()
  local filepath = vim.fn.expand('%')
  local filename = vim.fn.fnamemodify(filepath, ':t:r')
  vim.cmd(string.format("split | term ./run.sh %s %s", filepath, filename))
end, { desc = "[R]un the run.sh script in the pwd" })
