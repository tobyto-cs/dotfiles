function map(mode, lhs, rhs, opts)
  options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function nmap(lhs, rhs, opts)
  map("n", lhs, rhs, opts)
end
function xmap(lhs, rhs, opts)
  map("x", lhs, rhs, opts)
end
function imap(lhs, rhs, opts)
  map("i", lhs, rhs, opts)
end
