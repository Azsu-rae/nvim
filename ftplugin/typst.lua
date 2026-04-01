local file_path = vim.fn.expand('%:.')
local file_name = vim.fn.fnamemodify(file_path, ':t:r')

local output_path = vim.fn.fnamemodify(file_path, ":h") .. "/build"
local pdf_path = string.format("%s/%s.pdf", output_path, file_name)

local watch_job = nil
local pdf_job = nil

vim.keymap.set("n", "<leader>wtch", function()
  if watch_job then
    vim.notify("Typst watcher already running")
    return
  end

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

vim.keymap.set("n", "<leader>pdf", function()
  if pdf_job then
    vim.notify("PDF is already opened")
    return
  end

  pdf_job = vim.fn.jobstart({
    "sioyek",
    pdf_path,
  }, {
    on_exit = function()
      pdf_job = nil
    end,
  })

  vim.notify("Started sioyek!")
end)
