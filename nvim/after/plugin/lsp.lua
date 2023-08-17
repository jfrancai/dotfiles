local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<M-y>"] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.fn.sign_define('DiagnosticSignError', { text = '🦆', texthl = 'DiagnosticSignError' })
  vim.fn.sign_define('DiagnosticSignWarn', { text = '⚠️', texthl = 'DiagnosticSignWarn' })
  vim.fn.sign_define('DiagnosticSignInfo', { text = 'ℹ️', texthl = 'DiagnosticSignInfo' })
  vim.fn.sign_define('DiagnosticSignHint', { text = '🤔', texthl = 'DiagnosticSignHint' })
  vim.diagnostic.config({virtual_text = false})
  -- vim.diagnostic.config({virtual_text = false})
end)

lsp.set_server_config({
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- add null_ls so my lsp is not doing the vim.lsp.buffer.format() function call
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    server = {
        ['null_ls'] = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" },
    }
})

lsp.setup()
