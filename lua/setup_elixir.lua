-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
    -- TODO
end

lspconfig.elixirls.setup({
    cmd = {"elixir-ls"},
    on_attach = on_attach,
    settings = {
        dialyzerEnabled = false,
        fetchDeps = false,
    }
})
