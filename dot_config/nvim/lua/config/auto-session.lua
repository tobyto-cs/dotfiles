require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  pre_save_cmds = {
    function()
      local sources = { 'filesystem', 'buffers', 'git_status', 'migrations' }
      for k in pair(sources)
        do require('neo-tree.command').execute({ action = "close", source = k })
      end
    end
  },
}
