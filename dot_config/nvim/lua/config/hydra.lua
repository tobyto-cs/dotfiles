local hydra = require('hydra')
local splits = require('smart-splits')

local pcmd = require('hydra.keymap-util').pcmd

local buffer_hydra = hydra({
  name = "barbar",
  config = {
    on_key = function()
      -- to preserve animation
      vim.wait(200, function() vim.cmd 'redraw' end, false)
    end
  },
  heads = {
    { 'h', function() vim.cmd('BufferPrevious') end, { on_key = false } },
    { 'l', function() vim.cmd('BufferNext') end, { desc = 'choose', on_key = false } },

    { 'H', function() vim.cmd('BufferMovePrevious') end },
    { 'L', function() vim.cmd('BufferMoveNext') end, { desc = 'move' } },

    { 'p', function() vim.cmd('BufferPin') end, { desc = 'pin' } },

    { 'd', function() vim.cmd('BufferClose') end, { desc = 'close' } },
    { 'c', function() vim.cmd('BufferClose') end, { desc = false } },
    { 'q', function() vim.cmd('BufferClose') end, { desc = false } },

    { 'od', function() vim.cmd('BufferOrderByDirectory') end, { desc = 'by directory' } },
    { 'ol', function() vim.cmd('BufferOrderByLanguage') end,  { desc = 'by language' } },
    { '<Esc>', nil, { exit = true } }
  }
})

local function invoke_buffer_hydra()
  if #vim.fn.getbufinfo({buflisted = true}) > 1 then
    buffer_hydra:activate()
    vim.cmd('redrawstatus')
  end
end

vim.keymap.set('n', 'gb', invoke_buffer_hydra)

hydra({
  name = "Windows",
  config = {
    invoke_on_body = true,
  },
  mode = "n",
  body = "<C-w>",
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
    { '<C-s>', pcmd('split', 'E36'), { desc = false } },
    { 'v',     pcmd('vsplit', 'E36') },
    { '<C-v>', pcmd('vsplit', 'E36'), { desc = false } },

    { 'c',     pcmd('close', 'E444') },
    { 'q',     pcmd('close', 'E444'), { desc = 'close window' } },
    { '<C-c>', pcmd('close', 'E444'), { desc = false } },
    { '<C-q>', pcmd('close', 'E444'), { desc = false } },
  }
})
