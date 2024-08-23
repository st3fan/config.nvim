return {
  {
    "nvim-cmp",
    opts = {
      -- Disable when we're in comments
      enabled = function()
        local context = require("cmp.config.context")
        return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
      end,
    },
  },
}
