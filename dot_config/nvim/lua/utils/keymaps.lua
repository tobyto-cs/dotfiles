local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.nmap(lhs, rhs, opts)
  M.map("n", lhs, rhs, opts)
end
function M.xmap(lhs, rhs, opts)
  M.map("x", lhs, rhs, opts)
end
function M.imap(lhs, rhs, opts)
  M.map("i", lhs, rhs, opts)
end

return M
