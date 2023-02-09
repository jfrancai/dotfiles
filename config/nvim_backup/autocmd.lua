vim.api.nvim_create_autocmd("BufEnter",{
	pattern = { "*.tpp" },
	--command = "setlocal filetype=cpp",
	command = "echo hello",
})
