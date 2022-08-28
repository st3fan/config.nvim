-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

vim.g.mapleader = ","
--vim.g.localleader = "\\" -- Not sure what this does. I've never used this.

require("options")
require("plugins")
require("appearance")
require("mappings")

require("git")

require("setup_treesitter")
require("setup_completion")
--require("setup_elixir")
require("setup_neogit")
require("setup_golang")
require("setup_deno")
--require("setup_javascript")
require("setup_comment")
require("setup_rust")
require("setup_autopairs")
require("setup_lua")
require("setup_elixir")
