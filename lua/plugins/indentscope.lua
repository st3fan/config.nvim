return {
  {
    "echasnovski/mini.indentscope",
    enabled = false,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
}
