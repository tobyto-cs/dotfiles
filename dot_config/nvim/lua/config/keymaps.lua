local keys = require("utils.keymaps")

  -- Save key strokes (now we do not need to press shift to enter command mode).
keys.nmap(";", ":")
keys.xmap(';', ':')
-- Always use very magic mode for searching
keys.nmap("/", "/\\v")

  -- Move cursor based on physical lines, not actual lines.
keys.nmap('j', function()
  if vim.v.count == 0 then return 'gj' end
  return 'j'
end, { expr = true })
keys.nmap('k', function()
  if vim.v.count == 0 then return 'gk' end
  return 'k'
end, { expr = true })
keys.nmap('0', 'g0')


-- Change text w/o putting into register
keys.nmap('c', '\"_c')
keys.nmap('C', '\"_C')
keys.nmap('cc', '\"_cc')
keys.xmap('c', '\"_c')
