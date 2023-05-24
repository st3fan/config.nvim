return {
	"elixir-tools/elixir-tools.nvim", -- requires = { "nvim-lua/plenary.nvim" }})
	config = function()
		require("elixir").setup()
	end,
}

