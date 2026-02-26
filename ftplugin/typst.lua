vim.treesitter.start()

local watch_job = nil
local pdf_path = nil

vim.keymap.set("n", "<leader>wtch", function()
  ---@diagnostic disable-next-line: unnecessary-if
  if watch_job then
    vim.notify("Typst watcher already running")
    return
  end

  local file_path = vim.fn.expand('%:.')
  local file_name = vim.fn.fnamemodify(file_path, ':t:r')

  local output_path = vim.fn.fnamemodify(file_path, ":h")
  if vim.fn.fnamemodify(output_path, ":t") == "src" then
    output_path = vim.fn.fnamemodify(output_path, ":h") .. "/build"
  end
  pdf_path = string.format("%s/%s.pdf", output_path, file_name)

  watch_job = vim.fn.jobstart({
    "typst",
    "watch",
    file_path,
    pdf_path,
  }, {
    on_exit = function()
      watch_job = nil
    end,
  })

  vim.notify("Started typst watcher!")
end)

vim.keymap.set("n", "<leader>xdg", function()
  if watch_job == nil then
    vim.notify("You have to start the typst watcher!")
    return
  end

  vim.cmd(string.format("!xdg-open '%s'", pdf_path))
end)
