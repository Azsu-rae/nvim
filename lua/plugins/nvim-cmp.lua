return {
  "hrsh7th/nvim-cmp",
  dependencies = {

    -- sources
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',

    {
      -- snippet engine (required..)
      "L3MON4D3/LuaSnip",

      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)

      -- install jsregexp (optional!).
      -- build = "make install_jsregexp"

      -- adding vscode like snippets
      dependencies = { 'rafamadriz/friendly-snippets' },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local ls = require("luasnip")

        vim.keymap.set({ "i", "s" }, "<C-n>", function()
          if ls.choice_active() then ls.change_choice(1) end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-p>", function()
          if ls.choice_active() then ls.change_choice(-1) end
        end, { silent = true })
      end,
    },
  },

  config = function()
    -- Set up nvim-cmp.
    local cmp = require('cmp')
    local ls = require("luasnip")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"]     = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"]   = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ls.jumpable(-1) then
            ls.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]     = cmp.mapping.abort(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }),

        ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]     = cmp.mapping.scroll_docs(4),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- uses cmp-nvim-lsp
        { name = 'luasnip' },  -- For luasnip users.
      }, {
        { name = 'buffer' },   -- uses cmp-buffer
      })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })
    require("cmp_git").setup()
    ]] --

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end
}
