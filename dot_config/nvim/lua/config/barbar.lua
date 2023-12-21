local barbar = require('barbar')

barbar.setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  icons = {
    separator = {left = '▎', right = ''},
    separator_at_end = true,
    pinned = {button = '', filename = true},
    modified = { button = false, separator = { left = '▎' }},
    visible = { button = false, separator = { left = '▎' }},
    inactive = { button = false, separator = { left = '▎' }},
    current = { button = false, separator = { left = '▎' }},
  },
  -- Set filetypes that will offset barbar
  sidebar_filetypes = {
    NvimTree = true,
    -- ['neo-tree'] = { event = "BufWipeout" },
  },
  maximum_padding = 1,
  minimum_padding = 1,
})
