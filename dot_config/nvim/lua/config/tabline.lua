require('tabline').setup{
  enable = true,
  options = {
    show_filename_only = true,
    show_last_seperator = true,
    show_tabs_always = true
  }
}

vim.keymap.set('n', '<space><right>', '<Cmd>TablineBufferNext<Cr>')
vim.keymap.set('n', '<space><left>', '<Cmd>TablineBufferPrevious<Cr>')

vim.api.nvim_set_keymap('n', '<leader>tr', '', {
  noremap = true,
  callback = function()
    return vim.api.nvim_command("TablineTabRename " .. vim.fn.input("Enter new tab name: "))
  end,
  desc = "Prompt user for new tab name"
})

-- Tabline buffer binding
vim.api.nvim_set_keymap('n', '<leader>tb', ':TablineBuffersBind ', {
  noremap = true,
  desc = "Prompt user for new tab name"
})
