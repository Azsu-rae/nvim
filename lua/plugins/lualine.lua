return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = { theme = require('lualine.themes.gruvbox-material') },
    }
    vim.opt.showmode = false
  end,
}
