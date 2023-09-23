local dap = require('dap');
vim.g.dap_prev_executable = ""

dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = '/usr/bin/codelldb',
    args = { "--port", "13000"}
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      -- if (vim.g.dap_prev_executable ~= "" and
      --    pcall(vim.fn.readfile(vim.g.dap_prev_executable, "b", 0)))
      -- then
      --   vim.g.dap_prev_executable = vim.fn.input('Path to executable: ', vim.g.dap_prev_executable, 'file')
      -- else
      --   vim.g.dap_prev_executable = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. "/", 'file')
      -- end
      -- return vim.g.dap_prev_executable
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  }
}
