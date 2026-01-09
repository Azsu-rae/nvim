
vim.treesitter.start()

-- overengineered solution. Kept for reference
local function open_pdf_when_ready(retries, pdf_path)
  if vim.uv.fs_stat(pdf_path) then
    -- open with system PDF viewer
    vim.fn.jobstart({ "xdg-open", pdf_path }, { detach = true })
  elseif retries > 0 then
    vim.defer_fn(function()
      open_pdf_when_ready(retries - 1, pdf_path)
    end, 100) -- 100 ms
  else
    vim.notify("PDF not created yet", vim.log.levels.WARN)
  end
end

local watch_job = nil
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
  local pdf_path = string.format("%s/%s.pdf", output_path, file_name)

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

  open_pdf_when_ready(20, pdf_path)
end)

vim.keymap.set("n", "<leader>pdf", open_pdf_when_ready)
