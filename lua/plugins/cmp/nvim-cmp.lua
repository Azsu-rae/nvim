
-- Gain access to the functions of the cmp plugin
local cmp = require("cmp")

-- Gain access to the function of the luasnip plugin
local luasnip = require("luasnip")

local lspkind = require("lspkind")

-- Lazily load the vscode like snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- All the cmp setup function to configure our completion experience
cmp.setup({

    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
        })
    },

    -- How should completion options be displayed to us?
    completion = {
        -- menu: display options in a menu
        -- menuone: automatically select the first option of the menu
        -- preview: automatically display the completion candiate as you navigate the menu
        -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
        competeopt = "menu,menuone,preview,noselect",
    },

    -- setup snippet support based on the active lsp and the current text of the file
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- setup how we interact with completion menus and options
    mapping = cmp.mapping.preset.insert({

        -- next suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- previous suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        -- show completion suggestions
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- close completion window
        ["<C-e>"] = cmp.mapping.abort(),
    }),

    experimental = {
        ghost_text = true,
    },

    -- Where and how should cmp rank and find completions
    -- Order matters, cmp will provide lsp suggestions above all else
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    })
})

-- Enable function signatures when typing function arguments
require("lsp_signature").setup({
  bind = true,
  floating_window = true,
  hint_enable = true,
  handler_opts = {
    border = "rounded",
  },
})
