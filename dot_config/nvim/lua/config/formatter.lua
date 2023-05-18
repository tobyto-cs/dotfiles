-- Utilities for creating configurations
local util = require("formatter.util")

local function eslint_d()
	return {
		exe = "eslint_d",
		args = {
			"--no-eslintrc",
			"--config",
			"~/.config/nvim/config/formatters/eslint.json",
			"--stdin",
			"--stdin-filename",
			util.escape_path(util.get_current_buffer_file_path()),
			"--fix-to-stdout",
		},
		stdin = true,
		try_node_modules = true,
	}
end

local function prettierd()
	return {
		exe = "prettierd",
		args = { util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		cmake = {
			require("formatter.filetypes.cmake").cmakeformat,
		},
		javascript = { eslint_d, prettierd },
		javascriptreact = { eslint_d, prettierd },
		lua = { require("formatter.filetypes.lua").stylua },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
