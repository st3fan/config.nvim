-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

local opt = vim.opt
local cmd = vim.api.nvim_command

local lspconfig = require "lspconfig"

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TODO Copy pasta
function setup_eldoc()
  package.loaded["eldoc"] = nil
  eldoc = require "eldoc"
  eldoc.setup()
end

lspconfig.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    setup_eldoc()

    -- Highlight identifiers
    opt.updatetime = 500

    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
      callback = vim.lsp.buf.document_highlight
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references
    })
  end,
}

