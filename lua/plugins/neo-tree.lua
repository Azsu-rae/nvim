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

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      default_component_configs = {
        name = { use_git_status_colors = false },
        git_status = {
          symbols = {

            -- Change *type* (what happened to the file)
            --            added     = "➕", -- file added
            --            modified  = "✱", -- file modified
            --            deleted   = "🗑️", -- file deleted
            --            renamed   = "➡️", -- file renamed
            --
            --            -- *Status* (state in git)
            --            untracked = "?",  -- untracked
            --            ignored   = "○",  -- ignored
            --            unstaged  = "",  -- unstaged changes
            --            staged    = "✔️", -- staged
            --            conflict  = "",  -- merge conflict
            -- Change *type* (what happened to the file)
            added     = "", -- file added
            modified  = "", -- file modified
            deleted   = "", -- file deleted
            renamed   = "", -- file renamed

            -- *Status* (state in git)
            untracked = "", -- untracked
            ignored   = "", -- ignored
            unstaged  = "", -- unstaged changes
            staged    = "", -- staged
            conflict  = "", -- merge conflict
          },
        },
      },
    })
  end,
}
