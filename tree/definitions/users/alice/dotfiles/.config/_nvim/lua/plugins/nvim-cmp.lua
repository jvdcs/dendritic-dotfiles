local cmp = require('cmp')

cmp.setup({
  -- Configure the completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP suggestions
    { name = 'buffer' },   -- Text from current buffer
  }),

  -- Configure completion window styling
  -- window = {
  --   completion = cmp.config.window.rounded(),
  --   documentation = cmp.config.window.rounded(),
  -- },

  -- Configure keymaps for navigation and actions
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion menu
    -- ['<C-e>'] = cmp.mapping.abort(),        -- Close completion menu
    
    -- Accept current item
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    
    -- Custom navigation bindings (Alt+j and Alt+l)
    ['<A-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<A-l>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    -- ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    -- ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  }),
})
