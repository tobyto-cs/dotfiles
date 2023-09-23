local barbar = require('barbar')

barbar.setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  icons = {
    separator = {left = '', right = ''},
    separator_at_end = false,
    modified = { button = false, separator = { left = '' }},
    visible = { button = false, separator = { left = '' }},
    inactive = { button = false, separator = { left = '' }},
    current = { button = false, separator = { left = '' }},
  },
  -- Set filetypes that will offset barbar
  sidebar_filetypes = {
    NvimTree = true
  },
  maximum_padding = 1,
  minimum_padding = 1,
})
