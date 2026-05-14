-- Plugin: nvim-treesitter
-- URL: https://github.com/nvim-treesitter/nvim-treesitter
-- Description: Incremental parsing and better syntax highlighting using Treesitter.

return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      ensure_installed = {
        -- vim/lua
        "lua",
        "luadoc",
        "vim",
        "vimdoc",

        -- shell
        "bash",

        -- web
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        -- backend
        "python",
        "go",

        -- config/data
        "json",
        "yaml",
        "toml",
	"kdl",

        -- markdown
        "markdown",
        "markdown_inline",

        -- misc
        "regex",
        "query",
      },
    },
  },
}
