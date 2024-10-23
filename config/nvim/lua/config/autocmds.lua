-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local JfrancaiGroup = augroup("jfrancai", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  group = JfrancaiGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.diagnostic.config({ virtual_text = false })
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
  end,
})
