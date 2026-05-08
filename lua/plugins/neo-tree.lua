local function open_with_xdg(state)
  local node = state.tree:get_node()
  if not node then return end

  local path = node:get_id()
  vim.fn.jobstart({ "xdg-open", path }, { detach = true })
end

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
    vim.keymap.set("n", "<leader>e",
      "<CMD>Neotree position=left source=filesystem action=focus toggle=true reveal=true<CR>")
    vim.keymap.set("n", "<leader>ls", "<CMD>Neotree position=float action=focus source=buffers toggle=true<CR>")
    vim.keymap.set("n", "<leader>ge", "<CMD>Neotree position=float toggle source=filesystem <CR>")
    require("neo-tree").setup({
      window = {
        mappings = {
          ["z"] = open_with_xdg,
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })
  end,
}
