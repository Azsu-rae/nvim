-- vim.keymap.set("v", "<leader>x", function()
--   local start = vim.fn.getpos("'<")
--   local finish = vim.fn.getpos("'>")
--
--   local lines = vim.api.nvim_buf_get_text(
--     0,
--     start[2] - 1,
--     start[3] - 1,
--     finish[2] - 1,
--     finish[3] - 1,
--     {}
--   )
-- end, { desc = "Open currently selected uri" })

vim.keymap.set("n", "<leader>git", function()
  local commit_message = vim.fn.input("Commit message: ")
  if commit_message == "" then
    vim.notify("Aborted!")
    return
  end

  local add = vim.fn.system({ "git", "add", "." })
  local commit = vim.fn.system({ "git", "commit", "-m", commit_message })

  print(add)
  print(commit)
end, { desc = "Commit and push [git] changes" })

vim.keymap.set("n", "<leader>vi", function()
  vim.cmd("split | term tree --gitignore")
end, { desc = "[Vi]sualize directory structure" })

vim.keymap.set("n", "<leader>r", function()
  local filepath = vim.fn.expand('%')
  local filename = vim.fn.fnamemodify(filepath, ':t:r')
  vim.cmd(string.format("split | term ./run.%s %s %s", require("osconfig").ext, filepath, filename))
  vim.cmd("startinsert")
end, { desc = "[R]un the run.sh script in the pwd" })

vim.keymap.set("n", "<leader>t", function()
  local filepath = vim.fn.expand('%')
  local filename = vim.fn.fnamemodify(filepath, ':t:r')
  vim.cmd(string.format("split | term ./test.%s %s %s", require("osconfig").ext, filepath, filename))
  vim.cmd("startinsert")
end, { desc = "[T]est by running test.sh in the pwd" })
