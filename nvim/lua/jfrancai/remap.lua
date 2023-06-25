vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<esc><esc>", vim.cmd.nohls)
vim.api.nvim_set_keymap('v', '<C-y>', "<Esc>:'<,'>w !xclip -selection clipboard<CR>", {noremap = true, silent = true})
