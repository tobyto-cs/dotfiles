local keys = require('utils.keymaps')

-- lsp-config
  -- Global mappings
keys.nmap("<space>e", vim.diagnostic.open_float)
keys.nmap("[d", vim.diagnostic.goto_prev)
keys.nmap("]d", vim.diagnostic.goto_next)
keys.nmap("<space>q", function()
  vim.diagnostic.setqflist({ open = true })
end)

  -- Only after Lsp has started
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { silent = true, buffer = ev.bufnr }
    keys.nmap("gd", vim.lsp.buf.definition, opts)
    keys.nmap("<C-]>", vim.lsp.buf.definition, opts)
    keys.nmap("K", vim.lsp.buf.hover, opts)
    keys.nmap("<C-k>", vim.lsp.buf.signature_help, opts)
    keys.nmap("<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    keys.nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    keys.nmap("<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- nmap("<space>rn", vim.lsp.buf.rename, opts)
    keys.nmap("gr", vim.lsp.buf.references, opts)
    keys.nmap("<space>ca", vim.lsp.buf.code_action, opts)
  end
})


-- nvim-dap
local dap = require('dap');
local dap_widgets = require('dap.ui.widgets');
keys.nmap('<F5>', function() dap.continue() end)
keys.nmap('<F10>', function() dap.step_over() end)
keys.nmap('<F11>', function() dap.step_into() end)
keys.nmap('<F12>', function() dap.step_out() end)
keys.nmap('<Leader>b', function() dap.toggle_breakpoint() end)
keys.nmap('<Leader>B', function() dap.set_breakpoint() end)
keys.nmap('<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keys.nmap('<Leader>dr', function() dap.repl.open() end)
keys.nmap('<Leader>dl', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  dap_widgets.hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  dap_widgets.preview()
end)
keys.nmap('<Leader>df', function()
  dap_widgets.centered_float(dap_widgets.frames)
end)
keys.nmap('<Leader>ds', function()
  dap_widgets.centered_float(dap_widgets.scopes)
end)


-- hlslens
local kopts = {noremap = true, silent = true}

keys.nmap('n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
keys.nmap('N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
keys.nmap('*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
keys.nmap('#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
keys.nmap('g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
keys.nmap('g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  -- Removes highlighed searches
keys.nmap('<Leader>l', ':noh<CR>', kopts)


-- nvim-hop
  -- <Esc>: Quit hop action
keys.nmap('f',
  function()
    return require('hop').hint_char2()
  end,
  { silent = true, noremap = true, desc = "nvim-hop char2" })

-- nvim-tree, file browser
keys.nmap("<space>s", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "toggle nvim-tree" })


-- tabline
  -- nmap('<space><right>', '<Cmd>TablineBufferNext<Cr>')
  -- nmap('<space><left>', '<Cmd>TablineBufferPrevious<Cr>')
keys.nmap('<leader>tr', '', {
  noremap = true,
  callback = function()
    return vim.api.nvim_command("TablineTabRename " .. vim.fn.input("Enter new tab name: "))
  end,
  desc = "Prompt user for new tab name"
})
  -- Tabline buffer binding
keys.nmap('<leader>tb', ':TablineBuffersBind ', {
  noremap = true,
  desc = "Prompt user for new tab name"
})

-- telescope
local ts_builtin = require('telescope.builtin')
if ts_builtin then
  keys.nmap('<leader>ff', ts_builtin.find_files)
  keys.nmap('<leader>fg', ts_builtin.live_grep)
  keys.nmap('<leader>fb', ts_builtin.buffers)
  keys.nmap('<leader>fh', ts_builtin.help_tags)
end

-- Easy Align
keys.xmap('ga', '<Plug>(EasyAlign)')
keys.nmap('ga', '<Plug>(EasyAlign)')


-- vista
-- Tag viewer
keys.nmap('<Space>t', '<C-U>Vista!!<CR>', { silent = true })

-- vim-fugitive
keys.nmap('<leader>gs', ':Git<CR>', { silent = true })
keys.nmap('<leader>gw', ':Gwrite<CR>', { silent = true })
keys.nmap('<leader>gc', ':Git commit<CR>', { silent = true })
keys.nmap('<leader>gd', ':Gdiffsplit<CR>', { silent = true })
keys.nmap('<leader>gpl', ':Git pull<CR>', { silent = true })
keys.nmap('<leader>gpu', ':15split \\| term git push<CR>', { silent = true })

-- vim-sandwich
keys.nmap('s', '<Nop>', { noremap = false })
keys.xmap('s', '<Nop>', { noremap = false })
