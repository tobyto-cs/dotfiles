-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

cmp.setup({
	window = {
		documentation = {
			border = border,
		},
		completion = {
			border = border,
		},
	},
	snippet = {
		expand = function(args)
			-- For `ultisnips` user.
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		-- If select is true, will pick first selection automatically
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = {
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "ultisnips" }, -- For ultisnips user.
		{ name = "nvim_lua" }, -- for nvim lua function
		{ name = "path" }, -- for path completion
		{ name = "buffer", keyword_length = 4 }, -- for buffer word completion
		{ name = "emoji", insert = true }, -- emoji completion
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	view = {
		entries = "custom",
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				nvim_lsp = "[LSP]",
				ultisnips = "[US]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
				omni = "[Omni]",
			},
		}),
	},
})
