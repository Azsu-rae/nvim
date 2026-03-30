return {

  --        
  --        
  --          🌀   ✱   ⭒   ✦   *
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",         -- icons
    "antosha417/nvim-lsp-file-operations", -- optional LSP file ops
  },
  config = function()
    vim.keymap.set("n", "<leader>e", "<CMD>Neotree filesystem reveal toggle<CR>")
    vim.keymap.set("n", "<leader>E", "<CMD>Neotree action=show source=filesystem position=left toggle=false<CR>")

    vim.keymap.set("i", "<C-l>", function()
      vim.cmd("Neotree action=show source=filesystem position=left toggle=false")
    end)

    vim.keymap.set("t", "<C-o>", function()
      vim.cmd("Neotree action=show source=filesystem position=left toggle=false")
      vim.schedule(function() vim.cmd("startinsert") end)
    end)

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
