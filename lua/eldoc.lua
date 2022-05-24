-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local util = require('vim.lsp.util')
local lspconfig = require "lspconfig"

local M = {}

M.something = function()
    local params = util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result, ctx)
        if not (result and result.contents and result.contents.value) then
            vim.notify('')
            return
        end
        --vim.notify(vim.inspect(result))
        --vim.notify(tostring(result.contents))
        vim.notify(result.contents.value)
    end)
end

M.setup = function()
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
        callback = M.something
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = M.something
    })
end

return M

