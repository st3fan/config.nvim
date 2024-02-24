-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true            -- Show line numbers
vim.wo.signcolumn = 'yes'       -- Keep sign column on by default

vim.o.termguicolors = true      -- Better colors
vim.opt.cursorline = true       -- Show the cursor line

vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.hlsearch = false          -- Disable highlight on search
vim.o.clipboard = 'unnamedplus' -- Use system clipboard
vim.o.wrap = false              -- Don't wrap

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
