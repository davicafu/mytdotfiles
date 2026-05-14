-- Plugin: mason.nvim
-- URL: https://github.com/williamboman/mason.nvim
-- Description: Portable package manager for Neovim LSPs, linters and formatters.

-- Plugin: mason-lspconfig.nvim
-- URL: https://github.com/williamboman/mason-lspconfig.nvim
-- Description: Bridges mason.nvim with lspconfig.

-- Plugin: nvim-lspconfig
-- URL: https://github.com/neovim/nvim-lspconfig
-- Description: Quickstart configurations for the Neovim LSP client.

return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "gopls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff = {},
        gopls = {},
      },
    },
  },
}
