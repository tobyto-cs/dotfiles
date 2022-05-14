-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require('packer').startup({
  function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    use {"onsails/lspkind-nvim", event = "VimEnter"}
    -- auto-completion engine
    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {"hrsh7th/cmp-omni", after = "nvim-cmp" }

    -- lspconfig
    use {'neovim/nvim-lspconfig', after = "cmp-nvim-lsp", config =[[require('config.lsp')]] }

    use {'kyazdani42/nvim-web-devicons'}

    -- Powerline and tabline
    use {
      'nvim-lualine/lualine.nvim',
      config = [[require('config.statusline')]]
    }
    use {
      'kdheepak/tabline.nvim',
      config = [[require('config.tabline')]]
    }

    -- snippits
    use 'SirVer/ultisnips'
    use { 'quangnguyen30192/cmp-nvim-ultisnips', after = {'nvim-cmp', 'ultisnips'}}

    -- better insert mode escaping
    use 'jdhao/better-escape.vim'

    -- fuzzy finder
    use 'Yggdroot/LeaderF'

    -- tpope magic
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'

    -- completion of (), "", etc...
    use 'Raimondi/delimitMate'

    -- TODO: need to document controls
    use 'machakann/vim-sandwich'

    -- TODO: gotta learn this, looks cool
    use {
      'phaazon/hop.nvim',
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim-hop') end, 2000)
      end
    }

    -- TODO: need to document controls
    use {
      'kyazdani42/nvim-tree.lua',
      config = [[require('config.nvim-tree')]]
    }

    -- TODO: gotta learn these
    use {
      'kevinhwang91/nvim-bqf',
      config = [[require('config.nvim-bqf')]]
    }
    use {
      'kevinhwang91/nvim-hlslens',
      config = [[require('config.nvim-hlslens')]]
    }

    use {
      'gelguy/wilder.nvim',
      config = [[require('config.wilder')]],
      requires = {
        {'sharkdp/fd'},
        {'nixprime/cpsm'},
        {'romgrk/fzy-lua-native'}
      }
    }

    -- TODO: suuuuper useful self documentation on keybinds
    use {
      'folke/which-key.nvim',
      config = [[require('config.which-key')]]
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require('config.treesitter')]]
    }

    use 'skywind3000/asyncrun.vim'

    -- use 'preservim/vim-markdown'

    use({"liuchengxu/vista.vim", cmd = "Vista"})

    use {
      'karb94/neoscroll.nvim',
      config = [[require('config.neoscroll')]]
    }

    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Show git change signs in vim sign column
    use {"mhinz/vim-signify", event = 'BufEnter'}

    -- Show indentation lines
    -- use {
    --   "lukas-reineke/indent-blankline.nvim",
    --   event = 'VimEnter',
    --   config = [[require('config.indent-blankline')]]
    -- }

    -- TODO: need to learn (and document)
    use {"wellle/targets.vim", event = "VimEnter"}

    -- TODO: need to learn (and document)
    use {"andymass/vim-matchup", event = "VimEnter"}

    -- TODO: need to learn (and document)
    use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })

    -- Session management plugin
    use({"tpope/vim-obsession", cmd = 'Obsession'})

  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
  }
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end

