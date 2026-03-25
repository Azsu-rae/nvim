vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffa066", bg = "NONE" })
local me = {}
me.hi = "hiell"

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

  -- Same but when cursorline is set
  transparent("CursorLineNr")
  transparent("CursorLineSign")
end

local M = {}
M.transparent = transparent
M.set_transparent_bg = set_transparent_bg
M.hi = me
return M
