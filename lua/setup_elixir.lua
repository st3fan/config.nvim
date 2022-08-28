-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("elixir").setup({
    on_attach = function(client, bufnr)
        local map_opts = { buffer = true, noremap = true}

        -- standard lsp keybinds
        vim.keymap.set("n", "df", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", map_opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
        vim.keymap.set("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
        vim.keymap.set("n", "gD","<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
        vim.keymap.set("n", "1gD","<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
        -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
        -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
        -- there are also core vim.lsp functions that put the same data in the loclist
        -- vim.keymap.set("n", "gr", ":References<cr>", map_opts)
        -- vim.keymap.set("n", "g0", ":DocumentSymbols<cr>", map_opts)
        -- vim.keymap.set("n", "gW", ":WorkspaceSymbols<cr>", map_opts)
        -- vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)

    end,
    capabilities = capabilities
})
