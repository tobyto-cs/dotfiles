require('utils.keymaps')

  -- Save key strokes (now we do not need to press shift to enter command mode).
nmap(";", ":")
xmap(';', ':')

  -- Close location list or quickfix list if present
nmap('\\x', ':<C-U>windo lclose <bar> cclose<CR>', { silent = true })
  -- Close a buffer and switch to another buffer,
  -- Not closing the window
nmap('\\d', ':<C-U>bprevious <bar> bdelete #<CR>', { silent = true })


  -- Insert blank line above/below current line (no move cursor)
nmap('<Space>o', 'm`O<Esc>``')
nmap('<Space>o', 'm`o<Esc>``')

  -- Move cursor based on physical lines, not actual lines.
nmap('j', function()
  if vim.v.count == 0 then return 'gj' end
  return 'j'
end, { expr = true })
nmap('k', function()
  if vim.v.count == 0 then return 'gk' end
  return 'k'
end, { expr = true })
nmap('^', '^g')
nmap('0', 'g0')

  -- Jump to matching pairs in normal mode
nmap('<Tab>', '%')

  -- Goto start or end
nmap('H', '^')
xmap('H', '^')
nmap('L', 'g_')
xmap('L', 'g_')

  -- Continuous visual shifting
xmap('<', '<gv')
xmap('>', '>gv')

  -- Reselect pasted text
nmap('<leader>v', '`[v`]')

  -- Always use very magic mode for searching
nmap('/', '/\\v')

  -- Change text w/o putting into register
nmap('c', '\"_c')
nmap('C', '\"_C')
nmap('cc', '\"_cc')
xmap('c', '\"_c')


  -- Strip trailing whitespace
nmap('<leader><space>', ':<C-U>StripTrailingWhitespace<CR>')

  -- Window movement
nmap('<Left>', '<C-W>h')
nmap('<Right>', '<C-W>l')
nmap('<Up>', '<C-W>k')
nmap('<Down>', '<C-W>j')

  -- Do not move cursor when joining
nmap('J', 'mzJ`z')

  -- Turn word under cursor to uppercase
imap('<C-u>', '<Esc>viwUea')
  -- Turn word under cursor to titlecase
imap('<C-t>', '<Esc>b~lea')
