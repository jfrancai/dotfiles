return {
  { "tomasiser/vim-code-dark" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "codedark",
    },
  },
  {
    "dgagn/diagflow.nvim",
    opts = {},
    event = "LspAttach", -- This is what I use personnally and it works great
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.forge_fmt,
        nls.builtins.formatting.prettier,
      })
    end,
  },
}
