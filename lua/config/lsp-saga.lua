local saga = require('lspsaga')

saga.init_lsp_saga()

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {})
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", {})
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true})
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
-- Code actions
keymap("n", "ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
