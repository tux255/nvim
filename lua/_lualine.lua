-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

local gps = require("nvim-gps")

require('lualine').setup {
  options = {
    -- theme = bubbles_theme,
    -- theme = 'neon',
    -- theme = 'material-nvim',
    theme = 'dracula',
    component_separators = '❄',
    -- section_separators = { left = '', right = '' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        -- separator = { left = '' }, right_padding = 2
      },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_X = { '' },
    lualine_y = { '' },
    lualine_z = {
      {
        gps.get_location, cond = gps.is_available
        -- 'location',
        -- separator = { right = '' }, left_padding = 2
      },
    },
  },
  -- inactive_sections = {
  --   lualine_a = { 'filename' },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  -- tabline = {},
  extensions = {'nvim-tree'},
}
