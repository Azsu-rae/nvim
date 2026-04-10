return {
  --        
  --        
  --          🌀   ✱   ⭒   ✦   *
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>e", "<CMD>Neotree filesystem reveal toggle<CR>")
    vim.keymap.set("n", "<leader>ls", "<CMD>Neotree action=focus source=buffers position=float toggle=true<CR>")
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })
  end,
}
