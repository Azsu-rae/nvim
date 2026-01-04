
vim.treesitter.start()
local watch_job = nil

vim.keymap.set("n", "<leader>r", function()

  if watch_job then
    vim.notify("Typst watcher already running")
    return
  end

  local file_path = vim.fn.expand('%:.')
  local file_name = vim.fn.fnamemodify(file_path, ':t:r')

  local output_path = vim.fn.fnamemodify(file_path, ":h")
  if vim.fn.fnamemodify(output_path, ":t") == "src" then
    output_path = vim.fn.fnamemodify(output_path, ":h")
    output_path = output_path .. "/build"
  end

  watch_job = vim.fn.jobstart({
    "typst",
    "watch",
    file_path,
    string.format("%s/%s.pdf", output_path, file_name),
  }, {
    on_exit = function()
      watch_job = nil
    end,
  })

end)
