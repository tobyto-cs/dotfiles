require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "markdown" }, -- list of language that will be disabled
	},
	indent = {
		enable = false,
	},
	matchup = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
