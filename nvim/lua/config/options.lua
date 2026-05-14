-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- uncomment next line on WSL
require("config.clipboard")

-- enable clipboard on nvim with system
vim.opt.clipboard = "unnamedplus"
