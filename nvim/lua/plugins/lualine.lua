-- Plugin: lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- Description: A fast and customizable statusline for Neovim.

local mode = {
  "mode",
  icon = "󱗞",
  fmt = function(s)
    local mode_map = {
      ["NORMAL"] = "N",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R",
      ["COMMAND"] = "!",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T",
      ["EX"] = "X",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M",
    }

    return mode_map[s] or s
  end,
}

local filename = {
  "filename",
  path = 1,
  symbols = {
    modified = " ●",
    readonly = " ",
    unnamed = "[No Name]",
    newfile = "[New]",
  },
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = " ",
    warn = " ",
    info = " ",
    hint = "󰌵 ",
  },
}

local diff = {
  "diff",
  symbols = {
    added = " ",
    modified = " ",
    removed = " ",
  },
}

local function oil_path()
  local ok, oil = pcall(require, "oil")
  if not ok then
    return ""
  end

  local dir = oil.get_current_dir()
  if not dir then
    return ""
  end

  return vim.fn.fnamemodify(dir, ":~")
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      options = {
        theme = "auto",
        icons_enabled = true,
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },

      sections = {
        lualine_a = {
          mode,
        },

        lualine_b = {
          "branch",
        },

        lualine_c = {
          filename,
        },

        lualine_x = {
          diagnostics,
          diff,
        },

        lualine_y = {
          "filetype",
        },

        lualine_z = {
          "progress",
          "location",
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          filename,
        },
        lualine_x = {
          "location",
        },
        lualine_y = {},
        lualine_z = {},
      },

      extensions = {
        "quickfix",

        {
          filetypes = { "oil" },

          sections = {
            lualine_a = {
              mode,
            },

            lualine_b = {
              oil_path,
            },

            lualine_c = {},

            lualine_x = {},

            lualine_y = {},

            lualine_z = {},
          },
        },
      },
    },
  },
}
