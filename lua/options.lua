-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

vim.o.number = true
vim.o.relativenumber = false

vim.o.termguicolors = true
vim.o.syntax = 'on'

vim.o.ignorecase = true            -- bool: Ignore case in search patterns
vim.o.smartcase = true             -- bool: Override ignorecase if search contains capitals
vim.o.incsearch = true             -- bool: Use incremental search
vim.o.hlsearch = false             -- bool: Highlight search matches

vim.o.expandtab = true             -- bool: Use spaces instead of tabs
vim.o.shiftwidth = 4               -- num:  Size of an indent
vim.o.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
vim.o.tabstop = 4                  -- num:  Number of spaces tabs count for

-- Disabled because this confuses me every time
-- vim.o.autochdir = true             -- Automatically change cwd to buffer's file

vim.o.timeoutlen = 1000            -- Workaround for Comment not working?
