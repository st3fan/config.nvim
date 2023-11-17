-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local util = require('vim.lsp.util')

local M = {}

function is_rls(contents)
    return contents.language and contents.language == "rust"
end

function is_gopls(contents)
    return type(contents.value) == "string" and vim.startswith(contents.value, "```go\n")
end

local update_documentation = function()
    local params = util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result, ctx)
        local contents = nil
        if result and result.contents then
            contents = result.contents
            -- Some servers return a list of contents
            if vim.tbl_islist(contents) then
                contents = contents[1]
            end
        end

        if not contents then
            vim.api.nvim_echo({ { "" } }, false, {})
            return
        end

        -- Rust is simple, value contains a clear concise signature
        if is_rls(contents) then
            local line = contents.value:gsub("%s+", " ")
            vim.api.nvim_echo({ { line } }, false, {})
            return
        end

        -- Go returns Markdown by default
        if is_gopls(contents) then
            local value = contents.value
            if type(value) == "string" then
                local lines = vim.split(value, "\n", { plain = true, trimempty = true })
                if #lines >= 3 and lines[1] == "```go" then
                    local line = lines[2]
                    if vim.endswith(line, " struct {") or vim.endswith(line, " interface {") then
                        line = line:sub(0, -2)
                    end
                    vim.api.nvim_echo({ { line } }, false, {})
                end
            end
        end
    end)
end

M.setup = function()
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = update_documentation
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = update_documentation
    })
end

return M
