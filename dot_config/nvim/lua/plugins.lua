-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require("packer.util")

require("packer").startup({
	function(use)
		-- Packer can manage itself
		use({ "wbthomason/packer.nvim" })

		use({ "onsails/lspkind-nvim", event = "VimEnter" })
		-- auto-completion engine
		use({
			"hrsh7th/nvim-cmp",
			after = "lspkind-nvim",
			config = [[require('config.nvim-cmp')]],
		})

		-- nvim-cmp completion sources
		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })

		-- lspconfig
		use({
			"neovim/nvim-lspconfig",
			after = "cmp-nvim-lsp",
			config = [[require('config.lsp')]],
		})

		use({ "kyazdani42/nvim-web-devicons" })

		-- Powerline and tabline
		use({
			"nvim-lualine/lualine.nvim",
			config = [[require('config.statusline')]],
		})
		use({
			"kdheepak/tabline.nvim",
			config = [[require('config.tabline')]],
		})

		-- snippits
		use("SirVer/ultisnips")
		use({
			"quangnguyen30192/cmp-nvim-ultisnips",
			after = { "nvim-cmp", "ultisnips" },
		})

		-- better insert mode escaping
		use("jdhao/better-escape.vim")

		-- fuzzy finder
		use("Yggdroot/LeaderF")

		-- tpope magic
		use("tpope/vim-fugitive")
		use("tpope/vim-commentary")

		-- completion of (), "", etc...
		use("Raimondi/delimitMate")

		-- TODO: need to document controls
		use("machakann/vim-sandwich")

		use({
			"phaazon/hop.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.nvim-hop")
				end, 2000)
			end,
		})

		-- file browser
		use({
			"kyazdani42/nvim-tree.lua",
			config = [[require('config.nvim-tree')]],
		})

		-- better quickfix
		use({
			"kevinhwang91/nvim-bqf",
			config = [[require('config.nvim-bqf')]],
		})

		-- better highlighting
		use({
			"kevinhwang91/nvim-hlslens",
			config = [[require('config.nvim-hlslens')]],
		})

		-- nvim command autocomplete
		use({
			"gelguy/wilder.nvim",
			config = [[require('config.wilder')]],
			requires = {
				{ "sharkdp/fd" },
				{ "nixprime/cpsm" },
				{ "romgrk/fzy-lua-native" },
			},
		})

		-- TODO: suuuuper useful self documentation on keybinds
		use({
			"folke/which-key.nvim",
			config = [[require('config.which-key')]],
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[require('config.treesitter')]],
		})

		-- TODO: Setup config
		use("skywind3000/asyncrun.vim")

		-- ctags viewer
		use({
			"liuchengxu/vista.vim",
			config = [[require('config.vista')]],
		})
		-- automatic ctag generation
		use({ "ludovicchabant/vim-gutentags" })

		use({
			"karb94/neoscroll.nvim",
			config = [[require('config.neoscroll')]],
		})

		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- Show git change signs in vim sign column
		use({ "mhinz/vim-signify", event = "BufEnter" })

		-- Show indentation lines
		-- use {
		--   "lukas-reineke/indent-blankline.nvim",
		--   event = 'VimEnter',
		--   config = [[require('config.indent-blankline')]]
		-- }

		use({ "wellle/targets.vim", event = "VimEnter" })

		use({
			"andymass/vim-matchup",
			event = "VimEnter",
		})

		use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })

		-- Session management plugin
		use({ "tpope/vim-obsession", cmd = "Obsession" })

		-- Colors in hexcodes/rgba values
		use({
			"norcalli/nvim-colorizer.lua",
			config = [[require('config.nvim-colorizer')]],
		})

		-- Markdown plugins
		use({ "godlygeek/tabular" })
		use({
			"preservim/vim-markdown",
			config = [[require('config.vim-markdown')]],
		})
		use({ "vim-pandoc/vim-pandoc-syntax" })

		use({
			"matbme/JABS.nvim",
			config = [[require('config.JABS')]],
		})
		-- GLSL Support
		use({ "timtro/glslView-nvim", ft = "glsl" })
		use({ "tikhomirov/vim-glsl", ft = "glsl" })

		-- Highlighed "yank" region
		use({ "machakann/vim-highlightedyank" })

		-- format on save
		use({
			"mhartington/formatter.nvim",
			config = [[require('config.formatter')]],
		})

		-- better code renaming
		use({
			"smjonas/inc-rename.nvim",
			config = [[require('config.inc-rename')]],
		})

		-- take fancy pictures of code
		-- use({ "krivahtoo/silicon.nvim", run = "./install.sh build", config = [[require('config.silicon')]] })

		-- Better c/c++ higlighting
		-- use({ "jackguo380/vim-lsp-cxx-highlight" })

		use({ "windwp/nvim-ts-autotag" })
		use({ "mattn/emmet-vim" })

		use({ "junegunn/vim-easy-align" })

		use({ "kkoomen/vim-doge" })
	end,
	config = {
		max_jobs = 16,
		compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
	},
})

local status, _ = pcall(require, "packer_compiled")
if not status then
	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
