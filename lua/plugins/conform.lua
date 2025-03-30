return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      lua = { "stylua" },
      python = { "ruff_format" },
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_format = "never",
    },
  },
}
