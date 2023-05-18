require("silicon").setup({
	-- The following key is required if you want to save image to file instead of clipboard
	-- output = string,

	-- The following keys are all optional
	-- with default values
	font = "Hack=20",
	theme = "Monokai Extended Light",
	background = "#eff",
	shadow = {
		blur_radius = 0.0,
		offset_x = 0,
		offset_y = 0,
		color = "#555",
	},
	pad_horiz = 0,
	pad_vert = 0,
	line_number = true,
	line_pad = 2,
	line_offset = 1,
	tab_width = 4,
	round_corner = false,
	window_controls = false,
})
