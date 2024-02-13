local M = {}
local Keys = require("utils.keymaps")

function M.has(buffer, method)
  method = method:find("/") and method or "textDocument/" .. method
  local clients = require("utils.lsp").get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    if client.supports_method(method) then
      return true
    end
  end
  return false
end

M.keys = {
  { lhs = "<leader>cl", rhs = "<cmd>LspInfo<cr>", opts = { desc = "Lsp Info" }},
  { lhs = "gd", rhs = function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, opts = { desc = "Goto Definition" }, has = "definition"},
  { lhs = "gr", rhs = "<cmd>Telescope lsp_references<cr>", opts = { desc = "References" }},
  { lhs = "gD", rhs = vim.lsp.buf.declaration, opts = { desc = "Goto Declaration" }},
  { lhs = "gI", rhs = function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, opts = { desc = "Goto Implementation" }},
  { lhs = "gy", rhs = function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, opts = { desc = "Goto T[y]pe Definition" }},
  { lhs = "K", rhs = vim.lsp.buf.hover, opts = { desc = "Hover" }},
  { lhs = "gK", rhs = vim.lsp.buf.signature_help, opts = { desc = "Signature Help" } , has = "signatureHelp" },
  { lhs = "<c-k>", rhs = vim.lsp.buf.signature_help, mode = "i", opts = { desc = "Signature Help" }, has = "signatureHelp" },
  { lhs = "<leader>ca", rhs =vim.lsp.buf.code_action, opts = { desc = "Code Action" }, mode = { "n", "v" }, has = "codeAction" },
  {
    lhs = "<leader>cA",
    rhs = function()
      vim.lsp.buf.code_action({
        context = {
          only = {
            "source",
          },
          diagnostics = {},
        },
      })
    end,
    opts = { desc = "Source Action"},
    has = "codeAction",
  }
}

function M.on_attach(_, buffer)
  for _, key in pairs(M.keys) do
    if not M.keys.has or M.has(buffer, M.keys.has) then
      local opts = key.opts
      opts.buffer = buffer
      Keys.map(key.mode or "n", key.lhs, key.rhs, opts)
    end
  end
end

return M
