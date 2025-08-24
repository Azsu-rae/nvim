
-- Setup completion with specified sources
local cmp = require('cmp')

-- snippet engine
local luasnip = require('luasnip')

-- Formats the completion
local lspkind = require('lspkind')

-- Load friendly-snippets for VSCode-like snippets to LuaSnip
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').load({paths = Vimscript.stdpath("config") .. "/LuaSnip/lua/snippets/"})

-- Configure lsp_signature.nvim
require('lsp_signature').setup {
    bind = true,
    handler_opts = { border = "rounded" },
    hint_prefix = "🔍 ",
    hint_scheme = "String",
    floating_window = true,
    floating_window_above_cur_line = true,
    max_height = 12,
    max_width = 80,
    always_trigger = false,
    toggle_key = '<M-s>', -- Toggle signature help
    select_signature_key = '<M-n>', -- Cycle signatures
}

-- Setup nvim-cmp
cmp.setup {
    -- Enable snippet support with LuaSnip
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Key mappings
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
        ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
        ['<C-e>'] = cmp.mapping.abort(),         -- Cancel completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },

    -- Define completion sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },     -- LSP completions
        { name = 'luasnip' },      -- Snippet completions
        { name = 'buffer' },       -- Buffer words
        { name = 'path' },         -- Filesystem paths
    }),

    -- Enable lspkind for VSCode-like pictograms
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',  -- Show both symbol and text
            maxwidth = 50,         -- Limit completion item width
            ellipsis_char = '...', -- Truncation character
        }),
    },
}

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

-- `/` cmdline setup.
cmp.setup.cmdline({'/', '?'}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
