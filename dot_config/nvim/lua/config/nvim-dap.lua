local dap = require('dap');
vim.g.dap_prev_executable = ""

vim.fn.sign_define("DapBreakpoint", { text='', texthl="DapSign" })
vim.fn.sign_define("DapBreakpointCondition", { text='', texthl="DapSign" } )
vim.fn.sign_define("DapLogPoint", { text='', texthl="DapSign" } )
vim.fn.sign_define("DapStopped", { text='', texthl="DapSign" } )
vim.fn.sign_define("DapBreakpointRejected", { text='', texthl="DapSign" } )

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
