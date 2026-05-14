-- WSL Clipboard Integration
-- Description: Enables Neovim clipboard support inside WSL using win32yank.exe.
-- URL: https://github.com/equalsraf/win32yank

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",

    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },

    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },

    cache_enabled = 0,
  }
end
