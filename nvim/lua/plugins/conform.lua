-- Plugin: conform.nvim
-- URL: https://github.com/stevearc/conform.nvim
-- Description: Lightweight formatter plugin for Neovim.

return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },

      go = { "gofmt" },

      json = { "prettier" },

      yaml = { "prettier" },

      markdown = { "prettier" },

      html = { "prettier" },

      css = { "prettier" },

      javascript = { "prettier" },

      typescript = { "prettier" },

      javascriptreact = { "prettier" },

      typescriptreact = { "prettier" },

      kdl = { "kdlfmt" },

      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },

    formatters = {
      shfmt = {
        prepend_args = {
          "-i",
          "2",
          "-ci",
          "-sr",
        },
      },
    },
  },
}
