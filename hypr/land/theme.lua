hl.config({
	general = {

		gaps_in = 4,
		gaps_out = 9,
		border_size = 0,

		col = {
			active_border = "rgba(FFFFFF80)",
			inactive_border = "rgba(00000000)",
		},

		resize_on_border = false,

		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {

		rounding = 7,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = true,
			size = 4,
			passes = 0,
		},

		shadow = {
			enabled = true,
			range = 7,
			render_power = 3,
			color = 0xFF000000,
		},

		motion_blur = {
			enabled = true,
			samples = 7,
		}
	},
})
