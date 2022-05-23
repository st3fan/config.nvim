-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

return require('packer').startup(function()
    -- Manage Packer with Packer
    use 'wbthomason/packer.nvim'
    -- Appearance
    use { 'Mofiqul/dracula.nvim' }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true} }
end)

