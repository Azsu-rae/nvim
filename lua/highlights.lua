vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffa066", bg = "NONE" })

local set = vim.api.nvim_set_hl

local function transparent(group)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  hl.bg = "NONE"
  set(0, group, hl)
end

-- Normal editor windows
transparent("Normal")
transparent("NormalNC")

-- Floating windows (Telescope, LSP popups, etc.)
transparent("NormalFloat")
transparent("FloatBorder")

-- Window separators
transparent("WinSeparator")

-- Sign column / number column
transparent("SignColumn")
transparent("LineNr")
transparent("CursorLineNr")

-- Telescope specific
transparent("TelescopeNormal")
transparent("TelescopeBorder")
transparent("TelescopePromptNormal")
transparent("TelescopePromptBorder")
transparent("TelescopeResultsNormal")
transparent("TelescopePreviewNormal")

-- Remove background of the selected entry arrow
transparent("TelescopeSelection")
transparent("TelescopeSelectionCaret")

transparent("SignColumn")
transparent("SignColumnSB") -- sometimes used with scrollbars
transparent("DiagnosticSignError")
transparent("DiagnosticSignWarn")
transparent("DiagnosticSignInfo")
transparent("DiagnosticSignHint")

transparent("FoldColumn")
transparent("CursorLineFold")
transparent("CursorLineSign")
