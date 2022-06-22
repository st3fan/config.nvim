-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local map = vim.api.nvim_set_keymap

-- Telescope mappings should probably be in setup_telescope.lua

--map('n', '<leader>ff', [[:Telescope find_files<cr>]], {})
map('n', '<leader>tgf', [[:Telescope git_files<cr>]], {})
--map('n', '<leader>tb', [[:Telescope buffers<cr>]], {})
map('n', '<leader>fht', [[:Telescope help_tags<cr>]], {})

local no_preview = function()
  return require('telescope.themes').get_dropdown({
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
    width = 0.8,
    previewer = false,
    prompt_title = false
  })
end

vim.keymap.set('n', '<leader>tb', function()
    require('telescope.builtin').buffers(no_preview())
end)

-- Telescope find files
vim.keymap.set('n', '<leader>tff', function()
  require('telescope.builtin').find_files { previewer = false }
end)

-- telescope workspace diagnostics
vim.keymap.set('n', '<leader>twd', function()
    require('telescope.builtin').diagnostics({
        -- TODO Make this work. I would like 5 lines of results and the rest preview.
        layout_strategy = 'vertical',
        layout_config = { height = 0.80, width = 0.8 },
    })
end)

map('n', '<leader>fht', [[:Telescope help_tags<cr>]], {})
map('n', '<leader>fht', [[:Telescope help_tags<cr>]], {})

map('n', '<C-Left>', [[:tabprevious<cr>]], {})
map('n', '<C-Right>', [[:tabnext<cr>]], {})
