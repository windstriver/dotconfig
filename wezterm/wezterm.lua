local wezterm = require 'wezterm'

return {
  -- Font and Appearance
  font = wezterm.font 'JetBrains Mono',
  font_size = 12.0,

  -- Tab Bar
  hide_tab_bar_if_only_one_tab = true,

  -- 
  enable_wayland = false,
  front_end = "WebGpu",
}
