local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

map("i", "{<CR>", "{<CR>}<C-o>O")

-- Braces
map("i", "(", "()<left>")
map("i", ")", "<right>")
map("i", "))", ")")

-- Curly-Braces
map("i", "{", "{}<left>")
map("i", "}", "<right>")
map("i", "}}", "}")

-- Brackets
map("i", "[", "[]<left>")
map("i", "]", "<right>")
map("i", "]]", "]")
