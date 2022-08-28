-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local util = require('vim.lsp.util')

local M = {}

M.godoc = function(topic)
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative='editor', row=4, col=24, width=80, height=24, style='minimal', border='single'
    })
    local result = vim.fn.systemlist('go doc ' .. topic)
    vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, result)
end

M.setup = function()
    vim.api.nvim_create_user_command('GoDoc', function (opts)
        M.godoc(opts.args)
    end, { nargs = 1 })
end

return M

