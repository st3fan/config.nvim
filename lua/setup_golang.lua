-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

lspconfig = require "lspconfig"

function setup_eldoc()
    package.loaded["eldoc"] = nil
    eldoc = require "eldoc"
    eldoc.setup()
end

lspconfig.gopls.setup {
    cmd = { "gopls", "serve" },
    filetypes = {"go", "gomod"},
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    single_file_support = true,
    settings = {
        gopls = {
            hoverKind = "SingleLine", -- TODO Can we do this per request?
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
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

        -- TODO buf_set_keymap('n', 'K', 'run_eldoc()')

        setup_eldoc()
    end
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        vim.lsp.buf.formatting_sync(nil, 3000)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
        params.context = {only = {"source.organizeImports"}}

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
                else
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end
    end,
})

