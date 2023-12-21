
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
    dependencies = {
      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
    },
    config = function()
      require('config.nvim-cmp')
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require('config.lsp')
    end,
    dependencies = { "cmp-nvim-lsp" },
    lazy = false,
    priority = 60
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    dependencies = { "nvim-lspconfig" }
  },

  {
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup()
    end,
    lazy = false,
    priority = 70
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("mason-lspconfig").setup()
    end,
    dependencies = { "nvim-lspconfig", "mason.nvim"},
    lazy = false,
    priority = 65
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function ()
      require("mason-nvim-dap").setup()
    end,
    dependencies = { "nvim-dap", "mason.nvim" },
    lazy = false,
    priority = 65
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

  -- nvim-dap
  -- Debug Adapter Protocol for neovim
  {
    "mfussenegger/nvim-dap",
    config = function()
      require('config.nvim-dap')
    end,
    lazy = false,
    priority = 60
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require('config.nvim-dap-ui')
    end,
    dependencies = { "nvim-dap" }
  },

  {
    "Civitasv/cmake-tools.nvim",
    config = function()
      require('config.cmake-tools')
    end,
    dependencies = { "nvim-dap", "plenary.nvim" }
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require('config.rust-tools')
    end
  },

  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      require('config.persistent-breakpoints')
      -- TODO: Set better keymaps
      vim.keymap.set("n", "B", function()
          require('persistent-breakpoints.api').toggle_breakpoint()
      end, opts)
      vim.keymap.set("n", "<leader>bc", function()
          require('persistent-breakpoints.api').set_conditional_breakpoint()
      end, opts)
      vim.keymap.set("n", "<leader>bd", function()
          require('persistent-breakpoints.api').clear_all_breakpoints()
      end, opts)
    end,
    dependencies = { "nvim-dap" },
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require('dap-python').setup()
    end,
    dependencies = { "nvim-dap" }
  },

  -- heirline 
  -- Custom made statusline
  {
    "rebelot/heirline.nvim",
    config = function()
      require('config.heirline')
    end,
    dependencies = {
      "nvim-dap", "nvim-dap-ui", "hydra.nvim"
    }
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
  },

  { "mrjones2014/smart-splits.nvim" },

  -- Custom Submodes (resize mode, tab select, etc...)
  {
    "anuvyklack/hydra.nvim",
    config = function()
      require('config.hydra')
    end,
    dependencies = { "smart-splits.nvim" }
  }

}

require("lazy").setup(plugins, opts)

