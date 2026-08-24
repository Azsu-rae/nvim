vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffa066", bg = "NONE" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2a2a37" })                 -- slightly lifted from base
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#363646", bold = true }) -- selected row
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#54546d" })            -- scrollbar thumb
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2a2a37" })             -- scrollbar track
vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#54546d" })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#54546d" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#54546d" })

local function transparent(group)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  if not hl then
    vim.notify(string.format("didn't get %s", group))
    return
  end
  hl.bg = "NONE"
  vim.api.nvim_set_hl(0, group, hl)
end

local function set_transparent_bg(hg)
  if true then
    return
  end
  if vim.g.neovide then
    return
  end

  if hg then
    for _, group in ipairs(hg) do
      transparent(group)
    end
  end

  -- Normal editor windows
  transparent("Normal")
  transparent("NormalNC")
  transparent("CursorLine")

  -- Floating windows (Telescope, LSP popups, etc.)
  --  transparent("NormalFloat")
  transparent("FloatBorder")

  -- Window separators (already set)
  -- transparent("WinSeparator")

  -- Sign column / number column
  transparent("LineNr")

  transparent("SignColumn")
  transparent("DiagnosticSignError")
  transparent("DiagnosticSignWarn")
  transparent("DiagnosticSignInfo")
  transparent("DiagnosticSignHint")

  transparent("TabLine")
  transparent("TabLineSel")
  transparent("TabLineFill")

  -- Same but when cursorline is set
  transparent("CursorLineNr")
  transparent("CursorLineSign")
end

local M = {}
M.transparent = transparent
M.set_transparent_bg = set_transparent_bg
return M
