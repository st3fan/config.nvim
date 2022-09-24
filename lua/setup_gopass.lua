-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local sysname = vim.loop.os_uname().sysname

if sysname:match 'Darwin' then
  vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "/private/**/gopass**" },
    command = "setlocal noswapfile nobackup noundofile shada=''" }
  )
elseif sysname:match 'Linux' then
  vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "/dev/shm/gopass*" },
    command = "setlocal noswapfile nobackup noundofile shada=''" }
  )
end
