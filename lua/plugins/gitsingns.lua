return {
  "lewis6991/gitsigns.nvim",
  config = function(_, opts)
    require("gitsigns").setup(opts)
    vim.defer_fn(function()
      require("highlights").set_transparent_bg({
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        "GitSignsTopdelete",
        "GitSignsChangedelete",
        "GitSignsUntracked",
      })
    end, 100)
  end,
  opts = {},
}
