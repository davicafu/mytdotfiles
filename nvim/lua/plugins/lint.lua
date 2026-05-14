-- Plugin: nvim-lint
-- URL: https://github.com/mfussenegger/nvim-lint
-- Description: Asynchronous linting plugin for Neovim.

return {
  "mfussenegger/nvim-lint",

  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "ruff" },
      go = { "golangcilint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
