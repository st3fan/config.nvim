-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

-- https://www.reddit.com/r/neovim/comments/uz7cmu/heres_an_autocmd_for_conditionally_entering/

vim.api.nvim_create_augroup('Git', {})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'COMMIT_EDITMSG',
  callback = function()
    vim.wo.spell = true
    vim.api.nvim_win_set_cursor(0, {1, 0})
    if vim.fn.getline(1) == '' then
      vim.cmd 'startinsert!'
    end
  end,
  group = 'Git'
})

