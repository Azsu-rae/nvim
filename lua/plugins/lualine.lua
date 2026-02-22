return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
    vim.opt.showmode = false
  end,
}
