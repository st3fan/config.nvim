-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/
--
-- TODO Not sure why we need this
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require'cmp'
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local context = require("cmp.config.context")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

    -- Do not enable completion when inside a comment.
    enabled = function()
        return not (context.in_treesitter_capture("comment") or context.in_syntax_group("Comment"))
    end,

    -- Enable snippets
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = {
        --['<tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),

        -- For snippets with placeholders, use C-d/C-s to move forward/back between them.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    -- preselect = cmp.PreselectMode.None,

    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
    }),

    -- Minimal menu contents with just the symbol
    formatting = {
        format = lspkind.cmp_format({
            preset = 'default',
            mode = 'symbol_text',
            menu = {
                buffer   = "[Buf]",
                nvim_lsp = "[LSP]",
                luasnip  = "[Snp]",
                nvim_lua = "[Vim]",
                spell    = "[Spl]",
                path     = "[Pth]",
                cmdline  = "[Cmd]",
            },
        })
    }
})

require('luasnip.loaders.from_vscode').lazy_load()

