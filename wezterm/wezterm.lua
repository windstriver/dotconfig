local wezterm = require 'wezterm'

return {
  -- Font
  font = wezterm.font 'Fira Code',
  font_size = 12.0,

  -- Tab Bar
  hide_tab_bar_if_only_one_tab = true,

  -- Color Theme
  color_scheme = "Tokyo Night",
  -- color_scheme = "Catppuccin Latte",

  -- 
  enable_wayland = false,
  front_end = "WebGpu",

  -- window
  window_decorations = "RESIZE",
}
