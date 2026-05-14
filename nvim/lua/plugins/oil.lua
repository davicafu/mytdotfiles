-- Plugin: oil.nvim
-- URL: https://github.com/stevearc/oil.nvim
-- Description: File explorer that edits the filesystem like a normal Neovim buffer.

return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
  },
}
