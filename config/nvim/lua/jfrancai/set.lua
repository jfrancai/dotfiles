-- [[ Setting options ]]
-- See `:help vim.o`

-- Highlight cursor line
vim.o.cursorline = true

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Make relative line numbers default
vim.wo.nu = true
vim.wo.rnu = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set lines to keep above and below the cursor.
vim.o.scrolloff = 8

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

vim.o.termguicolors = true

-- Useful to align text.
vim.o.colorcolumn = "80"

-- Do not wrap lines
vim.o.wrap = false

vim.o.autoindent = true
-- Tabs looks like 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
-- Use real tabs over spaces
vim.o.expandtab = false
