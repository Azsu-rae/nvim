local colorscheme_config = {
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true,
  dimInactive = false,
  terminalColors = true,

  colors = {
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },

  overrides = function(colors)
    local theme = colors.theme
    return {
      -- Main editor background
      Normal = { bg = "none" },
      NormalFloat = { bg = "none" },

      -- Side columns
      SignColumn = { bg = "none" },
      FoldColumn = { bg = "none" },

      -- Line numbers
      LineNr = { fg = theme.ui.nontext },
      CursorLineNr = { fg = theme.ui.special, bold = true },

      -- Cursor line
      CursorLine = { bg = "NONE" },

      -- Floating windows borders
      FloatBorder = { fg = theme.ui.border, bg = "none" },

      -- Telescope / misc floats
      Pmenu = { bg = "none" },
      PmenuSel = { bg = theme.ui.bg_p2 },

      -- Statusline (important for lualine)
      StatusLine = { bg = "none" },
      StatusLineNC = { bg = "none" },
    }
  end,
}

return {
  "rebelot/kanagawa.nvim",
  config = function()
    --    require("kanagawa").setup(colorscheme_config)
    vim.cmd.colorscheme("kanagawa")
  end,
}
