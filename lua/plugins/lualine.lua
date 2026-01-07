return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- get the default Kanagawa lualine theme
    local kanagawa_lualine = require("lualine.themes.kanagawa")

    -- remove backgrounds
    kanagawa_lualine.normal.c.bg = "NONE"

    require("lualine").setup({
      options = {
        theme = kanagawa_lualine,
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      }
    })
    vim.opt.showmode = false
  end,
}
