vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmatch = true

vim.keymap.set("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

vim.diagnostic.config({ virtual_text = true })

vim.o.completeopt = "menu,noinsert,popup,fuzzy"

