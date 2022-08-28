-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
end

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.1"
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        }
    }
}

