-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

--
-- Show the filename in the top right
--

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "*" },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == "go" then
            vim.wo.winbar = "%=%m %f"
        else
            vim.wo.winbar = ""
        end
    end
})

--
-- Toggle Theme
--

local DARK_THEME = 'catppuccin-mocha'
local LIGHT_THEME = 'catppuccin-latte'

vim.keymap.set("n", "<leader>tt", function()
    if vim.g.colors_name == DARK_THEME then
        vim.cmd('colorscheme ' .. LIGHT_THEME)
    else
        vim.cmd('colorscheme ' .. DARK_THEME)
    end
end)

--
-- Toggle Number
--

vim.keymap.set("n", "<leader>tn", function()
    vim.o.number = not vim.o.number
end)
