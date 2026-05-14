-- Plugin: trouble.nvim
-- URL: https://github.com/folke/trouble.nvim
-- Description: Pretty diagnostics, references and quickfix UI for Neovim.

return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics",
    },
  },
}
