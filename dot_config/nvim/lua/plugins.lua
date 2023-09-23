  
require('utils.keymaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  -- nvim-cmp and completion sources
  -- Used for autocompletion
  { 
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
    },
    config = function() 
      require('config.nvim-cmp')
    end,
  },

  -- LuaSnip
  -- Used for code snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function()
      require('config.LuaSnip')
    end
  },

  -- nvim-web-devicons
  { "kyazdani42/nvim-web-devicons", lazy = true },

  -- gitsigns.nvim
  -- Adds support for added, removed, and changed lines
  { 
    "lewis6991/gitsigns.nvim",
    config = function() 
      require('config.gitsigns')
    end
  },

  -- heirline 
  -- Custom made statusline
  {
    "rebelot/heirline.nvim",
    config = function()
      require('config.heirline')
    end
  },

  -- barbar
  -- Custom tabline 
  {
    "romgrk/barbar.nvim",
    config = function()
      require('config.barbar')
    end
  },

  -- tpope plugins
  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },

  -- delimitMate
  -- completion of delimiters "", (), etc..
  {
    "Raimondi/delimitMate",
    config = function()
      require('config.delimitMate')
    end
  },

  -- vim-sandwich
  -- Action to surround object with delimiters
  {
    "machakann/vim-sandwich",
    config = function()
      nmap('s', '<Nop>', { noremap = false })
      xmap('s', '<Nop>', { noremap = false })
    end
  },

  -- hop.nvim
  -- Hop to character sequences (replace 'f/F')
  {
    "phaazon/hop.nvim",
    config = function()
      nmap('f', function() return require('hop').hint_char2() end,
           { silent = true, noremap = true, desc = "nvim-hop char2" })
      require('config.nvim-hop')
    end
  },

  -- neo-tree.nvim
  -- Filetree browser
  { 
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { 
      "plenary.nvim",
      "nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require('config.neo-tree')
    end,
    keys = {
      {
        "<space>s", function()
          require('neo-tree.command').execute({
            toggle = true, source = "filesystem", position = "left"
          })
        end
      },
    }
  },

  -- nvim-bqf
  -- better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
    config = function()
      require('config.nvim-bqf')
    end
  },

  -- wilder.nvim
  -- Better nvim wildmenu (command autocomplete)
  {
    "gelguy/wilder.nvim",
    config = function()
      require('config.wilder')
    end,
    dependencies = {
      "sharkdp/fd",
      "nixprime/cpsm",
      "romgrk/fzy-lua-native"
    },
  },

  -- autocomplete for vim language
  {
    "folke/which-key.nvim",
    config = function()
      require('config.which-key')
    end
  },

  -- nvim implementation of tree-sitter, an incremental parsing lib
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('config.treesitter')
    end
  },

  -- Ctags viewer
  { 
    "liuchengxu/vista.vim",
    config = function()
      require('config.vista')
    end,
  },
  -- Automatic ctag generation
  { "ludovicchabant/vim-gutentags" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "plenary.nvim" }
  },

  { "nvim-lua/plenary.nvim" },

  -- Adds extra object targets
  { "wellle/targets.vim", event = "VimEnter" },

  {
    "andymass/vim-matchup",
    config = function()
      require('config.vim-matchup')
    end
  },

  -- hexcode colors are visualized
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('config.nvim-colorizer')
    end
  },

  { "machakann/vim-highlightedyank" },

  -- Markdown plugins
  { "godlygeek/tabular", ft = "markdown" },
  { 
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      require('config.vim-markdown')
    end,
  },
  { "vim-pandoc/vim-pandoc-syntax", ft = "markdown" },

  -- GLSL plugins 
  { "timtro/glslView-nvim", ft = "glsl" },
  { "tikhomirov/vim-glsl", ft = "glsl" },

  { 
    dir = "~/.config/nvim/plugins/base16-nvim.nvim",
    config = function()
      vim.cmd([[colorscheme base16]])
    end
  },

  -- Higlighted "yank" region
  { "machakann/vim-highlightedyank" },

  {
    "mhartington/formatter.nvim",
    config = function()
      require('config.formatter')
    end
  },

  -- HTML tag stuff
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter" }
  },
  { "mattn/emmet-vim" },

  -- Documentaion generator
  { "kkoomen/vim-doge" },

  -- Session management
  { 
    "rmagatti/auto-session",
    config = function()
      require('config.auto-session')
    end,
    dependencies = { "neo-tree.nvim" }
  }

  -- Custom Submodes (resize mode, tab select, etc...)
  {
    "anuvyklack/hydra.nvim",
    config = function()
      require('config.hydra')
    end
  }

}

require("lazy").setup(plugins, opts)


-- -- Load packer.nvim
-- vim.cmd("packadd packer.nvim")
-- local util = require("packer.util")

-- require("packer").startup({
-- 	function(use)
-- 		-- Packer can manage itself
-- 		use({ "wbthomason/packer.nvim" })

-- 		use({ "onsails/lspkind-nvim" })
-- 		-- auto-completion engine
-- 		use({
-- 			"hrsh7th/nvim-cmp",
-- 			after = "lspkind-nvim",
-- 			config = [[require('config.nvim-cmp')]],
-- 		})

-- 		-- nvim-cmp completion sources
-- 		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
-- 		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
-- 		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
-- 		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
-- 		use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })

-- 		-- lspconfig
-- 		use({
-- 			"neovim/nvim-lspconfig",
-- 			after = "cmp-nvim-lsp",
-- 			config = [[require('config.lsp')]],
-- 		})

-- 		use({ "kyazdani42/nvim-web-devicons" })
--     use({
--       "lewis6991/gitsigns.nvim",
--       config = [[require('config.gitsigns')]]
--     })

-- 		-- Powerline and tabline
-- 		-- use({
-- 		-- 	"nvim-lualine/lualine.nvim",
-- 		-- 	config = [[require('config.statusline')]],
--       -- after = { "hydra.nvim" },
-- 		-- })
--     use({
--       "rebelot/heirline.nvim",
--       config = [[require('config.heirline')]]
--     })

--     use({
--       "romgrk/barbar.nvim",
--       config = [[require('config.barbar')]]
--     })

--     use({
--       "L3MON4D3/LuaSnip",
--       config = [[require('config.LuaSnip')]]
--     })

-- 		-- tpope magic
-- 		use("tpope/vim-fugitive")
-- 		use("tpope/vim-commentary")

-- 		-- completion of (), "", etc...
-- 		use({
--       "Raimondi/delimitMate",
--       config = [[require('config.delimitMate')]]
--     })

-- 		use("machakann/vim-sandwich")

-- 		use({
-- 			"phaazon/hop.nvim",
-- 			config = [[require("config.nvim-hop")]]
-- 		})

-- 		-- file browser
-- 		use({
-- 			"kyazdani42/nvim-tree.lua",
-- 			config = [[require('config.nvim-tree')]],
-- 		})

-- 		-- better quickfix
-- 		use({
-- 			"kevinhwang91/nvim-bqf",
-- 			config = [[require('config.nvim-bqf')]],
-- 		})

-- 		-- better highlighting
-- 		use({
-- 			"kevinhwang91/nvim-hlslens",
-- 			config = [[require('config.nvim-hlslens')]],
-- 		})

-- 		-- nvim command autocomplete
-- 		use({
-- 			"gelguy/wilder.nvim",
-- 			config = [[require('config.wilder')]],
-- 			requires = {
-- 				{ "sharkdp/fd" },
-- 				{ "nixprime/cpsm" },
-- 				{ "romgrk/fzy-lua-native" },
--         { "roxma/nvim-yarp" },
--         { "roxma/vim-hug-neovim-rpc" },
-- 			},
-- 		})

-- 		use({
-- 			"folke/which-key.nvim",
-- 			config = [[require('config.which-key')]],
-- 		})

-- 		use({
-- 			"nvim-treesitter/nvim-treesitter",
-- 			run = ":TSUpdate",
-- 			config = [[require('config.treesitter')]],
-- 		})

-- 		-- ctags viewer
-- 		use({
-- 			"liuchengxu/vista.vim",
-- 			config = [[require('config.vista')]],
-- 		})

-- 		-- automatic ctag generation
-- 		use({ "ludovicchabant/vim-gutentags" })

-- 		use({
-- 			"karb94/neoscroll.nvim",
-- 			config = [[require('config.neoscroll')]],
-- 		})

-- 		use({
-- 			"nvim-telescope/telescope.nvim",
-- 			requires = { "nvim-lua/plenary.nvim" },
-- 		})

-- 		use({ "wellle/targets.vim", event = "VimEnter" })

-- 		use({
-- 			"andymass/vim-matchup",
--       config = [[require('config.vim-matchup')]]
-- 		})

--     -- use({
--     --   "mfussenegger/nvim-dap",
--     --   config = [[require('config.nvim-dap')]]
--     -- })

--     -- use({
--     --   "rcarriga/nvim-dap-ui",
--     --   requires = { "mfussenegger/nvim-dap" },
--     --   config = [[require('config.nvim-dap-ui')]]
--     -- })

-- 		-- Colors in hexcodes/rgba values
-- 		use({
-- 			"norcalli/nvim-colorizer.lua",
-- 			config = [[require('config.nvim-colorizer')]],
-- 		})

-- 		-- Markdown plugins
-- 		use({ "godlygeek/tabular" })
-- 		use({
-- 			"preservim/vim-markdown",
-- 			config = [[require('config.vim-markdown')]],
-- 		})
-- 		use({ "vim-pandoc/vim-pandoc-syntax" })

-- 		-- GLSL Support
-- 		use({ "timtro/glslView-nvim", ft = "glsl" })
-- 		use({ "tikhomirov/vim-glsl", ft = "glsl" })

-- 		-- Highlighed "yank" region
-- 		use({ "machakann/vim-highlightedyank" })

-- 		-- format on save
-- 		-- use({
-- 		-- 	"mhartington/formatter.nvim",
-- 		-- 	config = [[require('config.formatter')]],
-- 		-- })

-- 		-- better code renaming
-- 		use({
-- 			"smjonas/inc-rename.nvim",
-- 			config = [[require('config.inc-rename')]],
-- 		})

-- 		-- take fancy pictures of code
-- 		-- use({ "krivahtoo/silicon.nvim", run = "./install.sh build", config = [[require('config.silicon')]] })

-- 		-- Better c/c++ higlighting
-- 		-- use({ "jackguo380/vim-lsp-cxx-highlight" })

-- 		use({ "windwp/nvim-ts-autotag" })
-- 		use({ "mattn/emmet-vim" })

-- 		use({ "junegunn/vim-easy-align" })

-- 		use({ "kkoomen/vim-doge" })

--     -- Automatic session management (save/load)
--     use({
--       "rmagatti/auto-session",
--       config = [[require('config.auto-session')]],
--       after = { "nvim-tree.lua" }
--     })

--     use({"mrjones2014/smart-splits.nvim"})

--     -- Custom Submodes (resize mode, tab select, etc...)
--     use({
--       "anuvyklack/hydra.nvim",
--       config = [[require('config.hydra')]],
--       after = { "smart-splits.nvim" }
--     })

--     -- Local version
--     -- base16-nvim
--     use({
--       "~/.config/nvim/plugins/base16-nvim.nvim"
--     })


-- 	end,
-- 	config = {
-- 		max_jobs = 16,
-- 		compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
--     ensure_dependencies = true,
--     log = { level = 'warn' },

-- 	},
-- })

-- local status, _ = pcall(require, "packer_compiled")
-- if not status then
-- 	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
-- end

-- require('keymaps.plugins');
