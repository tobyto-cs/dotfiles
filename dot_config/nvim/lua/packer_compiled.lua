-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["JABS.nvim"] = {
    config = { "require('config.JABS')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LeaderF = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/LeaderF",
    url = "https://github.com/Yggdroot/LeaderF"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["better-escape.vim"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/better-escape.vim",
    url = "https://github.com/jdhao/better-escape.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lspconfig" },
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips/after/plugin/cmp_nvim_ultisnips.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-omni"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-omni/after/plugin/cmp_omni.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cpsm = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/cpsm",
    url = "https://github.com/nixprime/cpsm"
  },
  delimitMate = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  fd = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/fd",
    url = "https://github.com/sharkdp/fd"
  },
  ["formatter.nvim"] = {
    config = { "require('config.formatter')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["glslView-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/glslView-nvim",
    url = "https://github.com/timtro/glslView-nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim-hop\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3Ð\aB\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "require('config.inc-rename')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["lspkind-nvim"] = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config.statusline')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "require('config.neoscroll')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-bqf"] = {
    config = { "require('config.nvim-bqf')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "cmp-omni", "cmp-path", "cmp-buffer", "cmp-nvim-lsp", "cmp-nvim-lua", "cmp-nvim-ultisnips" },
    config = { "require('config.nvim-cmp')" },
    load_after = {
      ["lspkind-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config.nvim-colorizer')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-gdb"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-gdb",
    url = "https://github.com/sakhnik/nvim-gdb"
  },
  ["nvim-hlslens"] = {
    config = { "require('config.nvim-hlslens')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config.lsp')" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "require('config.nvim-tree')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('config.treesitter')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["tabline.nvim"] = {
    config = { "require('config.tabline')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/tabline.nvim",
    url = "https://github.com/kdheepak/tabline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-glsl"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-glsl",
    url = "https://github.com/tikhomirov/vim-glsl"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-markdown"] = {
    config = { "require('config.vim-markdown')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-obsession"] = {
    commands = { "Obsession" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-signify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vista.vim"] = {
    config = { "require('config.vista')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "require('config.which-key')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "require('config.wilder')" },
    loaded = true,
    path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-gdb
time([[Setup for nvim-gdb]], true)
vim.cmd('packadd nvim-gdb')
time([[Setup for nvim-gdb]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
require('config.inc-rename')
time([[Config for inc-rename.nvim]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
require('config.tabline')
time([[Config for tabline.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require('config.formatter')
time([[Config for formatter.nvim]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
require('config.nvim-bqf')
time([[Config for nvim-bqf]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
require('config.vim-markdown')
time([[Config for vim-markdown]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config.statusline')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
require('config.nvim-hlslens')
time([[Config for nvim-hlslens]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
require('config.vista')
time([[Config for vista.vim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require('config.neoscroll')
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('config.nvim-colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('config.which-key')
time([[Config for which-key.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('config.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: JABS.nvim
time([[Config for JABS.nvim]], true)
require('config.JABS')
time([[Config for JABS.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
require('config.wilder')
time([[Config for wilder.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd ultisnips ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Obsession', function(cmdargs)
          require('packer.load')({'vim-obsession'}, { cmd = 'Obsession', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-obsession'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Obsession ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType glsl ++once lua require("packer.load")({'glslView-nvim', 'vim-glsl'}, { ft = "glsl" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lspkind-nvim', 'targets.vim', 'hop.nvim', 'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-signify'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]], true)
vim.cmd [[source /home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]]
time([[Sourcing ftdetect script at: /home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
