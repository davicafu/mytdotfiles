-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Inicializamos la semilla aleatoria con la hora del sistema
-- Esto asegura que sea un número distinto cada vez que abras Neovim
math.randomseed(os.time())

-- Pon aquí los nombres EXACTOS de tus temas
local my_themes = { "kanagawa", "tokyonight-night", "everforest" }

-- Elegimos un número aleatorio entre 1 y 2
local random_index = math.random(1, #my_themes)
local selected_theme = my_themes[random_index]

-- Usamos pcall (protected call) por si el tema falla o no está instalado,
-- así no te rompe el arranque de Neovim
local status_ok, _ = pcall(vim.cmd.colorscheme, selected_theme)

if not status_ok then
  vim.notify("Error al cargar el tema aleatorio: " .. selected_theme, vim.log.levels.WARN)
end
