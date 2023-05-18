-- cbase16::start
local colors = {
  black        = '#292c36',
  white        = '#d8d8d8',
  red          = '#f84547',
  green        = '#95c76f',
  blue         = '#8485ce',
  yellow       = '#efa16b',
  gray         = '#e8e8e8',
  darkgray     = '#333344',
  lightgray    = '#474160',
  inactivegray = '#d8d8d8',
}
-- cbase16::end

return {
	normal = {
		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
}
