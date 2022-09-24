-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local elixir = require("elixir")
elixir.setup({
  cmd = { "/tmp/elixir-ls/language_server.sh" },
})


-- local lspconfig = require("lspconfig")
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.elixirls.setup({
--     cmd = { "/tmp/elixir-ls/language_server.sh" },
--     capabilities = capabilities,
--     --root_dir = lspconfig.util.root_pattern("mix.exs"),
--     on_attach = function(_, _)
--         require("cmp_nvim_lsp").update_capabilities(capabilities)
--     end,
-- })
