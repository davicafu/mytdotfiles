-- Plugin: blink.cmp
-- URL: https://github.com/Saghen/blink.cmp
-- Description: A fast and modern completion engine for Neovim.

-- Plugin: LuaSnip
-- URL: https://github.com/L3MON4D3/LuaSnip
-- Description: A snippet engine for Neovim written in Lua.

-- Plugin: friendly-snippets
-- URL: https://github.com/rafamadriz/friendly-snippets
-- Description: A collection of community snippets for many languages.
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    version = "*",
  },
}
