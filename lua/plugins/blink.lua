return {
  "saghen/blink.cmp",
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true },
      ghost_text = {
        enabled = true,
        show_with_menu = false,
      },
      menu = {
        auto_show = false,
      },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
