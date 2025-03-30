---@type vim.lsp.Config
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "requirements.txt", ".git" },
  settings = {
    disableOrganizeImports = true,
  },
}
