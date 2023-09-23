require('utils.keymaps')

-- lsp-config
  -- Global mappings
nmap("<space>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<space>q", function()
  vim.diagnostic.setqflist({ open = true })
end)

  -- Only after Lsp has started
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { silent = true, buffer = ev.bufnr }
    nmap("gd", vim.lsp.buf.definition, opts)
    nmap("<C-]>", vim.lsp.buf.definition, opts)
    nmap("K", vim.lsp.buf.hover, opts)
    nmap("<C-k>", vim.lsp.buf.signature_help, opts)
    nmap("<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    nmap("<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- nmap("<space>rn", vim.lsp.buf.rename, opts)
    nmap("gr", vim.lsp.buf.references, opts)
    nmap("<space>ca", vim.lsp.buf.code_action, opts)
  end
})


-- nvim-dap
local dap = require('dap');
local dap_widgets = require('dap.ui.widgets');
nmap('<F5>', function() dap.continue() end)
nmap('<F10>', function() dap.step_over() end)
nmap('<F11>', function() dap.step_into() end)
nmap('<F12>', function() dap.step_out() end)
nmap('<Leader>b', function() dap.toggle_breakpoint() end)
nmap('<Leader>B', function() dap.set_breakpoint() end)
nmap('<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
nmap('<Leader>dr', function() dap.repl.open() end)
nmap('<Leader>dl', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  dap_widgets.hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  dap_widgets.preview()
end)
nmap('<Leader>df', function()
  dap_widgets.centered_float(dap_widgets.frames)
end)
nmap('<Leader>ds', function()
  dap_widgets.centered_float(dap_widgets.scopes)
end)


-- hlslens
local kopts = {noremap = true, silent = true}

nmap('n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
nmap('N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
nmap('*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
nmap('#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
nmap('g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
nmap('g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  -- Removes highlighed searches
nmap('<Leader>l', ':noh<CR>', kopts)


-- nvim-hop
  -- <Esc>: Quit hop action
nmap('f',
  function()
    return require('hop').hint_char2()
  end,
  { silent = true, noremap = true, desc = "nvim-hop char2" })

-- nvim-tree, file browser
nmap("<space>s", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "toggle nvim-tree" })


-- tabline
  -- nmap('<space><right>', '<Cmd>TablineBufferNext<Cr>')
  -- nmap('<space><left>', '<Cmd>TablineBufferPrevious<Cr>')
nmap('<leader>tr', '', {
  noremap = true,
  callback = function()
    return vim.api.nvim_command("TablineTabRename " .. vim.fn.input("Enter new tab name: "))
  end,
  desc = "Prompt user for new tab name"
})
  -- Tabline buffer binding
nmap('<leader>tb', ':TablineBuffersBind ', {
  noremap = true,
  desc = "Prompt user for new tab name"
})

-- telescope
local ts_builtin = require('telescope.builtin')
if ts_builtin then
  nmap('<leader>ff', ts_builtin.find_files)
  nmap('<leader>fg', ts_builtin.live_grep)
  nmap('<leader>fb', ts_builtin.buffers)
  nmap('<leader>fh', ts_builtin.help_tags)
end

-- Easy Align
xmap('ga', '<Plug>(EasyAlign)')
nmap('ga', '<Plug>(EasyAlign)')


-- vista
-- Tag viewer
nmap('<Space>t', '<C-U>Vista!!<CR>', { silent = true })

-- vim-fugitive
nmap('<leader>gs', ':Git<CR>', { silent = true })
nmap('<leader>gw', ':Gwrite<CR>', { silent = true })
nmap('<leader>gc', ':Git commit<CR>', { silent = true })
nmap('<leader>gd', ':Gdiffsplit<CR>', { silent = true })
nmap('<leader>gpl', ':Git pull<CR>', { silent = true })
nmap('<leader>gpu', ':15split \\| term git push<CR>', { silent = true })

-- vim-sandwich
nmap('s', '<Nop>', { noremap = false })
xmap('s', '<Nop>', { noremap = false })
