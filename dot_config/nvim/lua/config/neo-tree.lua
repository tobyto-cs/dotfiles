require('neo-tree').setup({
  source_selector = {
    winbar = false,
    statusbar = true
  },
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols"
  },
  popup_border_style = "NC",
  enable_git_status = true,
  enable_diagnostics = true,
  window = {
    width = 40,
    mappings = {
      ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
      ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
      ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
    }
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    }
  }
})

