local hydra = require('hydra')
local splits = require('smart-splits')

local floatOpts = require('config.lsp').floatOpts

local pcmd = require('hydra.keymap-util').pcmd
local cmd = require('hydra.keymap-util').cmd

local border = { "🭽","▔","🭾", "▕", "🭿", "▁", "🭼", "▏", }


local tabline_hint = [[
    Actions                         Order by
    _h_ _l_: Goto  _H_ _L_: Move            _od_: Directory    
    _p_: Pin _d_: Close                 _ol_: Language
    _r_: Restore                      _ow_: Window #
    _P_: Pick _D_: Pick Close           _ob_: Buffer #
]]

-- Barbar Hydra
local buffer_hydra = hydra({
  name = "TABLINE",
  hint = tabline_hint,
  config = {
    on_key = function()
      -- to preserve animation
      vim.wait(200, function() vim.cmd 'redraw' end, 100)
    end,
    hint = {
      type = "window",
      position = "bottom",
      border = border,
      show_name = false,
    }
  },
  heads = {
    { 'h', function() vim.cmd('BufferPrevious') end, { on_key = false } },
    { 'l', function() vim.cmd('BufferNext') end, { desc = 'choose', on_key = false } },

    { 'H', function() vim.cmd('BufferMovePrevious') end },
    { 'L', function() vim.cmd('BufferMoveNext') end, { desc = 'move' } },

    { 'p', function() vim.cmd('BufferPin') end, { desc = 'pin' } },

    { 'd', function() vim.cmd('BufferClose') end, { desc = 'close' } },
    { 'r', function() vim.cmd('BufferRestore') end, { desc = 'restore' } },

    { 'P', function() vim.cmd('BufferPick') end, { desc = 'pick' } },
    { 'D', function() vim.cmd('BufferPickDelete') end, { desc = 'pick close' } },

    { 'od', function() vim.cmd('BufferOrderByDirectory') end, { desc = 'by directory' } },
    { 'ol', function() vim.cmd('BufferOrderByLanguage') end,  { desc = 'by language' } },
    { 'ow', function() vim.cmd('BufferOrderByWindowNumber') end, { desc = 'by window #' } },
    { 'ob', function() vim.cmd('BufferOrderByBufferNumber') end,  { desc = 'by buffer #' } },
    { '<Esc>', function() vim.cmd('redrawstatus') end, { exit_before = true } }
  }
})


local window_hint = [[
   Move       Size            Split
     _k_        _<C-k>_       _s_: horizontally   
   _h_   _l_  _<C-h>_   _<C-l>_   _v_: vertically
     _j_        _<C-j>_       _d_: close
                          _=_: equalize    
   _<Esc>_
]]

local window_hydra = hydra({
  name = "WINDOWS",
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      type = "window",
      position = "bottom",
      border = border,
      show_name = false,
    }
  },
  mode = "n",
  heads = {
    { 'h', '<C-w>h'},
    { 'j', '<C-w>j'},
    { 'k', pcmd('wincmd k', 'E11', 'close')},
    { 'l', '<C-w>l'},

    { '<C-h>', function() splits.resize_left(2)  end },
    { '<C-j>', function() splits.resize_down(2)  end },
    { '<C-k>', function() splits.resize_up(2)    end },
    { '<C-l>', function() splits.resize_right(2) end },
    { '=', '<C-w>=', { desc = 'equalize'} },

    { 's',     pcmd('split', 'E36') },
    { 'v',     pcmd('vsplit', 'E36') },

    { 'd',     pcmd('close', 'E444'), { desc = 'close window' } },
    { '<Esc>', function() vim.cmd('redrawstatus') end, { exit_before = true } }
  }
})

local telescope_hint = [[
   _f_: files       _m_: marks
   _o_: old files   _g_: live grep
   _p_: projects    _/_: search in file
   _H_: highlights  _a_: autocommands
   _r_: resume      _u_: undotree
   _h_: vim help    _c_: execute command
   _k_: keymaps     _;_: commands history   
   _O_: options     _?_: search history
 
   _<Enter>_: Telescope           _<Esc>_
]]


local telescope_hydra = hydra({
  name = "TELESCOPE",
  hint = telescope_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      type = "window",
      position = "bottom",
      border = border,
      show_name = false,
    }
  },
  heads = {
    { 'f', cmd 'Telescope find_files' },
    { 'g', cmd 'Telescope live_grep' },
    { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
    { 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },
    { 'm', cmd 'MarksListBuf', { desc = 'marks' } },
    { 'k', cmd 'Telescope keymaps' },
    { 'O', cmd 'Telescope vim_options' },
    { 'r', cmd 'Telescope resume' },
    { 'p', cmd 'Telescope projects', { desc = 'projects' } },
    { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
    { 'H', cmd 'Telescope highlights' },
    { 'a', cmd 'Telescope autocommands' },
    { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
    { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
    { 'c', cmd 'Telescope commands', { desc = 'execute command' } },
    { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
    { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
    { '<Esc>', function() vim.cmd('redrawstatus') end, { exit_before = true } }
  }
})

local lsp_hint = [[
    _a_: Code Action    _d_: Prev Diagnositc    
    _h_: Hover Info     _D_: Next Diagnostic    
    _r_: Code Refs      _R_: Inc Rename

                          _<Esc>_
]]

local lsp_hydra = hydra({
  name = "LSP",
  hint = lsp_hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      type = "window",
      position = "bottom",
      border = border,
      show_name = false,
    }
  },
  heads = {
    { 'a', function() vim.lsp.buf.code_action() end, { exit = true, desc = 'code action' }},
    { 'd', function() vim.diagnostic.goto_next({ float = floatOpts }) end, { desc = 'next diag' }},
    { 'D', function() vim.diagnostic.goto_prev({ float = floatOpts }) end, { desc = 'prev diag' }},
    { 'h', function() vim.lsp.buf.hover() end, { exit = true, desc = 'hover information'}},
    { 'r', function() require('telescope.builtin').lsp_references() end,
        { exit = true, desc = 'code references'}},
    { 'R', ":IncRename ", { exit = true }
    },
    { '<Esc>', function() vim.cmd('redrawstatus') end, { exit_before = true } }
  }
})

local cmake_hint = [[
    _a_: Code Action    _d_: Prev Diagnositc    
    _h_: Hover Info     _D_: Next Diagnostic    
    _r_: Code Refs      _R_: Inc Rename

                          _<Esc>_
]]

local cmake_hydra = hydra({
  name = "CMAKE",
  hint = cmake_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      type = "window",
      position = "bottom",
      border = border,
      show_name = false,
    }
  },
  heads = {
    { '<Esc>', nil, { exit = true, nowait = true }}
  }
})
---
-- Hydra Invoking
---

local function invoke_buffer_hydra()
  if #vim.fn.getbufinfo({buflisted = true}) > 1 then
    buffer_hydra:activate()
    vim.cmd('redrawstatus')
  end
end

local function invoke_window_hydra()
  window_hydra:activate()
  vim.cmd('redrawstatus')
end

local function invoke_telescope_hydra()
  telescope_hydra:activate()
  vim.cmd('redrawstatus')
end

local function invoke_lsp_hydra()
  lsp_hydra:activate()
  vim.cmd('redrawstatus')
end

local function invoke_cmake_hydra()
  cmake_hydra:activate()
  vim.cmd('redrawstatus')
end

vim.keymap.set('n', '<leader>t', invoke_buffer_hydra)
vim.keymap.set('n', '<C-w>', invoke_window_hydra)
vim.keymap.set('n', '<leader>f', invoke_telescope_hydra)
vim.keymap.set('n', '<leader>l', invoke_lsp_hydra)
vim.keymap.set('n', '<leader>c', invoke_cmake_hydra)
