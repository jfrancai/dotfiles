vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<esc><esc>", vim.cmd.nohls)

local a = 0;
local b = 0;

function setA()
    a = vim.api.nvim_win_get_cursor(0)[1]
end

function setB()
    b = vim.api.nvim_win_get_cursor(0)[1]
end

function printAB()
	if a == 0 or b == 0 then
		print('please set start/end')
	else
		os.execute('s.sh ' .. a .. ' ' .. b)
		os.execute('ls')
		a = 0
		b = 0
	end
end

vim.keymap.set("n", "<leader>S", setA)
vim.keymap.set("n", "<leader>E", setB)
vim.keymap.set("n", "<leader>P", printAB)
