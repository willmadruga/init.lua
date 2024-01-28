vim.g.mapleader = " "
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")


-- COLEMAK -------------------------------------------------------
vim.keymap.set("n", "I", "i") -- Capital 'i' puts in insert mode
vim.keymap.set("n", ";", ":")

vim.keymap.set({'n', 'v'}, "m", "h")
vim.keymap.set({'n', 'v'}, "n", "j")
vim.keymap.set({'n', 'v'}, "e", "k")
vim.keymap.set({'n', 'v'}, "i", "l")

-- COLEMAK -------------------------------------------------------
