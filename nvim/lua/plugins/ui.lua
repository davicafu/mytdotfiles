-- Plugin: noice.nvim
-- URL: https://github.com/folke/noice.nvim
-- Description: Modern UI replacement for messages, cmdline and popupmenu in Neovim.

-- Plugin: nui.nvim
-- URL: https://github.com/MunifTanjim/nui.nvim
-- Description: UI component library for Neovim plugins.

-- Plugin: nvim-notify
-- URL: https://github.com/rcarriga/nvim-notify
-- Description: Fancy notification manager for Neovim.

return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

}
