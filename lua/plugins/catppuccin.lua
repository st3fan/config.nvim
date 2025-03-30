return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        no_bold = true,
      })
      vim.cmd("colorscheme catppuccin")
    end,
  }

