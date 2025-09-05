
local M = {}

-- Snippet engine
local luasnip = require('luasnip')

-- Autocompletion engine
local cmp = require('cmp')

-- Completion mappings
local mappings = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select=true}),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, {'i','s'}),
    ['<C-p>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {'i','s'}),
}

-- nvim-cmp config
local config = {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = mappings,
    sources = cmp.config.sources({
        {name="lazydev", groupe_index=0},
        {name='nvim_lsp', groupe_index=1},
        {name='luasnip', groupe_index=1},
        {name='buffer', groupe_index=2},
        {name='path', groupe_index=1},
    }),
    formatting = {
        format = require('lspkind').cmp_format {
            mode = 'symbol_text',  -- Show both symbol and text
            maxwidth = 50,         -- Limit completion item width
            ellipsis_char = '...', -- Truncation character
        },
    },
}

-- Anything after pressing : is called an Ex command (short for ex mode command, from the Unix editor ex)
local ex_cmdline_config = {
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
}

local search_cmdline_config = {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
}

M.setup = function()
    cmp.setup(config)
    cmp.setup.cmdline(':', ex_cmdline_config)
    cmp.setup.cmdline({'/', '?'}, search_cmdline_config)
end

return M
