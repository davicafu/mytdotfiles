-- Plugin: nvim-colorizer.lua
-- URL: https://github.com/norcalli/nvim-colorizer.lua
-- Description: Highlights color codes directly in the buffer.

-- Plugin: kanagawa.nvim
-- URL: https://github.com/rebelot/kanagawa.nvim
-- Description: A clean and elegant Neovim colorscheme inspired by Japanese aesthetics.

-- Plugin: nightfox.nvim
-- URL: https://github.com/EdenEast/nightfox.nvim
-- Description: A highly customizable Neovim colorscheme suite.

-- Plugin: tokyonight.nvim
-- URL: https://github.com/folke/tokyonight.nvim
-- Description: A clean, dark and modern Neovim colorscheme.

return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        "*",
        kdl = {
          RGB = true,
          RRGGBB = true,
          names = false,
          css = false,
          css_fn = false,
        },
      })
    end,
  },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { "sainnhe/everforest" }

}
