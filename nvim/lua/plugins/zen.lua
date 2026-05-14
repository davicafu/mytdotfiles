-- Plugin: zen-mode.nvim
-- URL: https://github.com/folke/zen-mode.nvim
-- Description: Distraction-free coding mode for Neovim.

return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        twilight = { enabled = true },
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
  },
}
