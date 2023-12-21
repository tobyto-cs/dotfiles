local function close_cmake_buffers()
  for _, v in pairs(vim.api.nvim_list_bufs()) do
    if (vim.api.nvim_buf_get_option(v, "filetype") == "cmake_tools_terminal") then
      vim.api.nvim_buf_delete(v)
    end
  end
end

require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  pre_save_cmds = {
    function()
      require('neo-tree.command').execute({ action = "close" })
      require('dapui').close()
      close_cmake_buffers()
      vim.api.nvim_command("CMakeClose")
      -- save barbar pins
      vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
    end
  },
}
