-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/

vim.g.mapleader = ","
vim.g.localleader = "\\"

require("options")
require("plugins")
require("appearance")
require("mappings")

require("setup_treesitter")
require("setup_golang")
require("setup_neogit")

