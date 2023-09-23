local M = {}
local defaults = {
    base00 = '#1e1e1e', base01 = '#323537', base02 = '#464b50', base03 = '#5f5a60',
    base04 = '#838184', base05 = '#a7a7a7', base06 = '#c3c3c3', base07 = '#ffffff',
    base08 = '#cf6a4c', base09 = '#cda869', base0A = '#f9ee98', base0B = '#8f9d6a',
    base0C = '#afc4db', base0D = '#7587a6', base0E = '#9b859d', base0F = '#9b703f',
    opts = {
      useBold = true,
      useUnderline = true,
      useUndercurl = true,
      useUnderdouble = true,
      useUnderdotted = true,
      useUnderdashed = true,
      useStrikethrough = true,
      useReverse = true,
      useItalic = true,
      useStandout = true,
      useAltfont = true,
    }
}

-- t is a table of settings
function M.setColors(c)
  -- Default values if they aren't specified
  if c then
    setmetatable(c, { __index=defaults })
  else
    c = defaults
  end

  -- Lookup tables
  c.gc = {
    b0 = c.base00,
    b1 = c.base01,
    b2 = c.base02,
    b3 = c.base03,
    b4 = c.base04,
    b5 = c.base05,
    b6 = c.base06,
    b7 = c.base07,
    b8 = c.base08,
    b9 = c.base09,
    bA = c.base0A,
    bB = c.base0B,
    bC = c.base0C,
    bD = c.base0D,
    bE = c.base0E,
    bF = c.base0F
  }

  c.tc = {
    b0 = 00,
    b1 = 18,
    b2 = 19,
    b3 = 08,
    b4 = 20,
    b5 = 07,
    b6 = 21,
    b7 = 15,
    b8 = 01,
    b9 = 16,
    bA = 03,
    bB = 02,
    bC = 06,
    bD = 04,
    bE = 05,
    bF = 17,
  }

  vim.g.base16_color_table = c

  -- Setup the terminal colors correctly
  vim.g.terminal_color_0 =  c.base00
  vim.g.terminal_color_1 =  c.base01
  vim.g.terminal_color_2 =  c.base02
  vim.g.terminal_color_3 =  c.base03
  vim.g.terminal_color_4 =  c.base04
  vim.g.terminal_color_5 =  c.base05
  vim.g.terminal_color_6 =  c.base06
  vim.g.terminal_color_7 =  c.base07
  vim.g.terminal_color_8 =  c.base08
  vim.g.terminal_color_9 =  c.base09
  vim.g.terminal_color_10 = c.base0a
  vim.g.terminal_color_11 = c.base0b
  vim.g.terminal_color_12 = c.base0c
  vim.g.terminal_color_13 = c.base0d
  vim.g.terminal_color_14 = c.base0e
  vim.g.terminal_color_15 = c.base0f

  require('base16-nvim.groups.vim').setup()
  require('base16-nvim.groups.languages').setup()
  require('base16-nvim.groups.plugins').setup()
end

return M
