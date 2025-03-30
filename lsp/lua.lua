-- luals.lua
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", "stylua.toml" },
  telemetry = { enabled = false },
  formatters = {
    ignoreComments = false,
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      signatureHelp = { enabled = true },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
