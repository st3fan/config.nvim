local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "startup-nvim/startup.nvim"
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        config = true
    },

    {
        "farmergreg/vim-lastplace"
    },

    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    {
        "mvpopuk/inspired-github.vim"
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    {
        "mbbill/undotree"
    },

    {
        "neovim/nvim-lspconfig"
    },

    {
        "williamboman/mason.nvim"
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    -- Messy ...
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { 'j-hui/fidget.nvim',                        tag = 'legacy',                                   opts = {} },
    { 'VonHeikemen/lsp-zero.nvim',                branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip',                         dependencies = { "rafamadriz/friendly-snippets" } },
    { 'saadparwaiz1/cmp_luasnip' },

})