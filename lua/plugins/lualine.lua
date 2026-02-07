return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- get the default Kanagawa lualine theme
    local theme = require("lualine.themes.dracula")

    -- sections go: a, b, and c
    theme.normal.c.bg = "#141414"
    theme.normal.b.bg = "#222222"

    theme.insert.c.bg = "#141414"
    theme.insert.b.bg = "#222222"

    theme.visual.c.bg = "#141414"
    theme.visual.b.bg = "#222222"

    theme.replace.c.bg = "#141414"
    theme.replace.b.bg = "#222222"

    theme.command.c.bg = "#141414"
    theme.command.b.bg = "#222222"
    --    kanagawa_lualine.normal.c.fg = "#ffffff"


    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      }
    })
    vim.opt.showmode = false
  end,
}
