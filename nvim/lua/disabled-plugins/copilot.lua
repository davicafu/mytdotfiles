-- Plugin: copilot.lua
-- URL: https://github.com/zbirenbaum/copilot.lua
-- Description: GitHub Copilot integration for Neovim.

return {
  "zbirenbaum/copilot.lua",
  optional = true,
  enabled = false,
  opts = function()
    require("copilot.api").status = require("copilot.status")
    require("copilot.api").filetypes = {
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    }
  end,
}
