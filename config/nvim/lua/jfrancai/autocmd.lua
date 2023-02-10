local augroup = vim.api.nvim_create_augroup

local cpp_group = augroup('TppFile', { clear = true })
local highlight_group = augroup('YankHighlight', { clear = true })

local autocmd = vim.api.nvim_create_autocmd

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('BufEnter', {
  group = cpp_group,
  pattern = '*.tpp',
  callback = function ()
    vim.o.filetype = 'cpp'
  end,
})
