local lsp = vim.lsp

local M = {}

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

M.floatOpts = {
  focusable = false,
  close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  border = border,
  source = "always", -- show source in diagnostic popup window
  prefix = " ",
}

-- LSP settings (for overriding per client)
M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	["eslint/probeFailed"] = function()
		vim.notify("ESLint probe failed.", vim.log.levels.WARN)
		--return { id = nil, result = true }
		return {}
	end,
	["eslint/noLibrary"] = function()
		vim.notify("Unable to find ESLint library.", vim.log.levels.WARN)
		return {}
		-- return { id = nil, result = true }
	end,
}

M.custom_attach = function(client, bufnr)
	local cap = client.server_capabilities
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			-- Don't open over other floating windows
			for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_win_get_config(winid).zindex then
					return
				end
			end
			vim.diagnostic.open_float(nil, M.floatOpts)
		end,
	})

	-- Set some key bindings conditional on server capabilities
	-- vim.keymap.set("n", "<space>f", vim.lsp.buf.format, opts)
	-- vim.keymap.set("x", "<space>f", vim.lsp.buf.range_formatting, opts)

	-- The blow command will highlight the current variable and its usages in the buffer.
	if cap.document_highlight then
		vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
	end

	if vim.g.logging_level == "debug" then
		local msg = string.format("Language server %s started!", client.name)
		vim.notify(msg, 0, { title = "Nvim-config" })
	end
end

-- Disable inline diagnostics
vim.diagnostic.config({ virtual_text = false })

M.capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

-- lua-language-server
lspconfig.lua_ls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})


-- regen100 cmake-language-server
lspconfig.cmake.setup({})

-- MaskRay ccls server
lspconfig.ccls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "build", ".git"),
	init_options = {
		highlight = { lsRanges = true },
		compilationDatabaseDirectory = "build",
	},
})

-- bash-lsp bash-language-server
lspconfig.bashls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
})

-- python-lsp python-lsp-server
lspconfig.pylsp.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
})

--  marksman markdown-lsp-server
lspconfig.marksman.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
})

-- aca emmet-ls
lspconfig.emmet_ls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

lspconfig.tsserver.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
})

-- hrsh7th vscode-language-servers
lspconfig.eslint.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})
lspconfig.cssls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})
lspconfig.html.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})
lspconfig.jsonls.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	root_dir = lspconfig.util.root_pattern(".git"),
})

lspconfig.pyright.setup({
	handlers = M.handlers,
	on_attach = M.custom_attach,
	capabilities = M.capabilities,
	-- root_dir = cmakeconfig.util.root_pattern(".git"),
})


return M
