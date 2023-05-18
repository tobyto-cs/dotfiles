-- (Optional) easy way to get Neovim current size.
local ui = vim.api.nvim_list_uis()[1]

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}
require('jabs').setup({
    position = 'corner', -- center, corner
    width = 50,
    height = 10,
    border = border, -- none, single, double, rounded, solid, shadow, (or an array or chars)

    -- Options for preview window
    preview_position = 'left', -- top, bottom, left, right
    preview = {
        width = 40,
        height = 30,
        border = border, -- none, single, double, rounded, solid, shadow, (or an array or chars)
    },

   	-- the options below are ignored when position = 'center'
    col = ui.width,  -- Window appears on the right
    row = ui.height/2, -- Window appears in the vertical middle
})

vim.keymap.set('n', '<leader>b', '<Cmd>JABSOpen<Cr>', { noremap = true, silent = true } )
