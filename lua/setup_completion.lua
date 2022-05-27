
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require'cmp'

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})
