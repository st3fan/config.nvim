-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"            -- str:  Allow syntax highlighting
opt.termguicolors = true     -- bool: If term supports ui color then enable
cmd('colorscheme dracula')   -- cmd:  Set the colorscheme

require('lualine').setup {
  options = {
    theme = 'dracula-nvim',
    icons_enabled = false,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
}
