-- TELESCOPE
--
-- transparent caret/indicator on selected result
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "NONE" })
-- transparent selected result
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
-- make the border area transparent
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
-- if you want the prompt area transparent too
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
-- and the preview/results borders
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })

-- NEOTREE
--
-- Change file name color
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#a8e3a1", bg = "NONE" })
-- Change icon color
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#89b4fa", bg = "NONE" })
-- Change modified indicator
vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = "#f7768e", bg = "NONE", bold = true })
-- Change indent marker color
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#6e6c7c", bg = "NONE" })
-- Sidebar background
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
-- added (green)
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#7A88CF", bg = "NONE" })
-- modified (muted yellow/orange)
vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = "#1628f2", bg = "NONE" })
-- deleted (red)
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#F7768E", bg = "NONE" })
-- conflict (bright warning)
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#F7768E", bg = "NONE", bold = true })


vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#F7768E", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#E6C384", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#7A88CF", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#A9B1D6", bg = "NONE" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = "#54546D" })
