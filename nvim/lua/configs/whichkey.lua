-- Which Key setup
require("which-key").setup {
  -- Configuration options for the popup
  window = {
    border = "rounded",    -- rounded border for the popup window
    position = "bottom",   -- position of the window (could be 'bottom', 'top', etc.)
  },
  layout = {
    height = { min = 4, max = 25 },  -- Configure the height of the popup
    width = { min = 20, max = 50 },  -- Configure the width of the popup
  },
}

-- Key mappings with Which Key
local wk = require("which-key")
wk.register({
  f = {
    name = "Files",         -- File-related actions
    f = { ":Telescope find_files<CR>", "Find File" },
    r = { ":Telescope live_grep<CR>", "Search Files" },
  },
  g = {
    name = "Git",           -- Git-related actions
    s = { ":Git<CR>", "Status" },
  },
})
