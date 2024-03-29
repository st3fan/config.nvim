-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr }) -- see :help lsp-zero-keybindings
end)

require('mason').setup({
  -- TODO
})

require('mason-tool-installer').setup({
  ensure_installed = {
    "goimports",
    "ruff",
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "ruff_lsp",
    "rust_analyzer",
    "terraformls",
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      usePlaceholders = true,
    },
  },
  on_attach = function(client, bufnr)
    lsp_zero.async_autoformat(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
      end,
    })

    --  Highlight identifiers
    vim.opt.updatetime = 500

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      callback = vim.lsp.buf.document_highlight
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references
    })
  end
})

lspconfig.rust_analyzer.setup({
  -- TODO
})

lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function(args)
        require("conform").format({ bufnr = bufnr })
      end,
    })
  end
})

lspconfig.ruff_lsp.setup({
  -- TODO
})

lspconfig.html.setup({
  -- TODO
})

lspconfig.htmx.setup({
  -- TODO
})

lspconfig.jsonls.setup({
  -- TODO
})

lspconfig.terraformls.setup({
  -- TODO
})

--local lua_opts = lsp_zero.nvim_lua_ls()
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-fields" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false
      },
    },
  },
  on_attach = function(client, bufnr)
    lsp_zero.async_autoformat(client, bufnr)
  end
})

--
-- Setup cmp
--

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require('luasnip.loaders.from_vscode').load()

cmp.setup({
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Supertab
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = cmp_format,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  enabled = function()
    local context = require("cmp.config.context")
    return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
  end
})
