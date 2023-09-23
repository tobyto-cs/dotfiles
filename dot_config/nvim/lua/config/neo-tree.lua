require('neo-tree').setup({
  popup_border_style = "NC",
  enable_git_status = true,
  enable_diagnostics = true,
  window = {
    width = 30,
    mappings = {
      ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
      ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
      ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
    }
  }
})

