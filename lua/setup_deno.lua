-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local opt = vim.opt
local cmd = vim.api.nvim_command

local lspconfig = require "lspconfig"

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.denols.setup {
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local buf_set_keymap = function(mode, key, result)
            vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>",
                {noremap = true, silent = true})
        end
        -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L211
        buf_set_keymap('n', 'gd', 'vim.lsp.buf.declaration()')
        buf_set_keymap('n', 'gD', 'vim.lsp.buf.definition()')
        buf_set_keymap('n', 'gi', 'vim.lsp.buf.implementation()<CR>')
        buf_set_keymap('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
        buf_set_keymap('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
        buf_set_keymap('n', 'K', 'vim.lsp.buf.hover()')
        buf_set_keymap('n', '<C-k>', 'vim.lsp.buf.signature_help()')
        -- Telescope
        buf_set_keymap('n', '<leader>fds', "require('telescope.builtin').lsp_document_symbols()")
        buf_set_keymap('n', '<leader>fws', "require('telescope.builtin').lsp_workspace_symbols()")

        -- Highlight identifiers
        opt.updatetime = 500

        vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
            callback = vim.lsp.buf.document_highlight
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references
        })
    end
}

