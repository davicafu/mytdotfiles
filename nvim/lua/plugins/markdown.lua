-- Plugin: render-markdown.nvim
-- URL: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- Description: Render markdown directly inside Neovim with a live preview-like experience.

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",

    ft = { "markdown" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {},

    keys = {
      {
        "<leader>mr",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Render Markdown",
      },
    },
  },
}

