-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local cmp = require('cmp_nvim_lsp')
local lsp = require('lspconfig')

local opt = vim.opt
local cmd = vim.api.nvim_command

local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- If the LSP supports formatting, allow for format-on-save through LSP
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

lsp.tsserver.setup{
    cmd = {"./node_modules/.bin/typescript-language-server", "--stdio"},
    capabilities = capabilities,
    on_attach = on_attach,
    debounce_text_changes = 150,
    single_file_support = true,
    init_options = {
        hostInfo = "neovim",
        preferences = {
            includeCompletionsWithSnippetText = true,
            includeCompletionsForImportStatements = true,
        },
    },
}

vim.o.completeopt = "menu,menuone,noselect"


