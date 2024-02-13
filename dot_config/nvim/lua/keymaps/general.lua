local keys = require('utils.keymaps')

  -- Save key strokes (now we do not need to press shift to enter command mode).
keys.nmap(";", ":")
keys.xmap(';', ':')

  -- Close location list or quickfix list if present
keys.nmap('\\x', ':<C-U>windo lclose <bar> cclose<CR>', { silent = true })
  -- Close a buffer and switch to another buffer,
  -- Not closing the window
keys.nmap('\\d', ':<C-U>bprevious <bar> bdelete #<CR>', { silent = true })


  -- Insert blank line above/below current line (no move cursor)
keys.nmap('<Space>o', 'm`O<Esc>``')
keys.nmap('<Space>o', 'm`o<Esc>``')

  -- Move cursor based on physical lines, not actual lines.
keys.nmap('j', function()
  if vim.v.count == 0 then return 'gj' end
  return 'j'
end, { expr = true })
keys.nmap('k', function()
  if vim.v.count == 0 then return 'gk' end
  return 'k'
end, { expr = true })
keys.nmap('^', '^g')
keys.nmap('0', 'g0')

  -- Goto start or end
keys.nmap('H', '^')
keys.xmap('H', '^')
keys.nmap('L', 'g_')
keys.xmap('L', 'g_')

  -- Continuous visual shifting
keys.xmap('<', '<gv')
keys.xmap('>', '>gv')

  -- Reselect pasted text
keys.nmap('<leader>v', '`[v`]')

  -- Always use very magic mode for searching
keys.nmap('/', '/\\v')

  -- Change text w/o putting into register
keys.nmap('c', '\"_c')
keys.nmap('C', '\"_C')
keys.nmap('cc', '\"_cc')
keys.xmap('c', '\"_c')


  -- Strip trailing whitespace
keys.nmap('<leader><space>', ':<C-U>StripTrailingWhitespace<CR>')

  -- Window movement
keys.nmap('<Left>', '<C-W>h')
keys.nmap('<Right>', '<C-W>l')
keys.nmap('<Up>', '<C-W>k')
keys.nmap('<Down>', '<C-W>j')

  -- Do not move cursor when joining
keys.nmap('J', 'mzJ`z')

  -- Turn word under cursor to uppercase
keys.imap('<C-u>', '<Esc>viwUea')
  -- Turn word under cursor to titlecase
keys.imap('<C-t>', '<Esc>b~lea')
