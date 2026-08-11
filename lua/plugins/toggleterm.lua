return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = "<c-\\>",
      direction = 'float',
    })

    vim.keymap.set("n", "<leader>sc", "<CMD>ToggleTermSendCurrentLine<CR>")
    vim.keymap.set("v", "<leader>sv", "<CMD>ToggleTermSendVisualLines<CR>")
    vim.keymap.set("v", "<leader>ss", "<CMD>ToggleTermSendVisualSelection<CR>")
  end,
}
