-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"            -- str:  Allow syntax highlighting
opt.termguicolors = true     -- bool: If term supports ui color then enable
vim.opt.signcolumn = 'yes'   -- str: column for signs

opt.background = 'light'
cmd('colorscheme tokyonight')

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    icons_enabled = false,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
}

-- Highlight identifiers

opt.updatetime = 500
cmd('highlight LspReferenceText guibg=lightgrey') -- TODO This needs be theme independent

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    callback = vim.lsp.buf.document_highlight
})

vim.api.nvim_create_autocmd("CursorMoved", {
    callback = vim.lsp.buf.clear_references
})

