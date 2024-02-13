return {
  { "mrjones2014/smart-splits.nvim" },

  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup()
  --   end,
  --   dependencies = { "mason.nvim" },
  --   lazy = false,
  -- },

  -- Session management
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      pre_save_cmds = {
        function()
          require('neo-tree.command').execute({ action = "close" })
          require('dapui').close()
          vim.api.nvim_command("CMakeClose")
          -- save barbar pins
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end
      },
    },
    config = function(_, opts)
      require('auto-session').setup(opts)
    end,
    dependencies = { "neo-tree.nvim" }
  },

  { "nvim-lua/plenary.nvim" },
}
