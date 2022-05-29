-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

return require('packer').startup(function()
    -- Manage Packer with Packer
    use 'wbthomason/packer.nvim'
    -- Appearance
    -- use { 'Mofiqul/dracula.nvim' }
    -- use { 'sainnhe/gruvbox-material' }
    -- use { 'folke/tokyonight.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use { 'Mofiqul/vscode.nvim' }
    -- use { "ellisonleao/gruvbox.nvim" }
    -- use { "projekt0n/github-nvim-theme" }
    -- Navigation
    use { 'farmergreg/vim-lastplace' }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- General Development
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    -- Go
    use { 'neovim/nvim-lspconfig' }
    -- use { 'crispgm/nvim-go', config = function() require('go').setup({}) end }
    -- Completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'rafamadriz/friendly-snippets' }
end)

