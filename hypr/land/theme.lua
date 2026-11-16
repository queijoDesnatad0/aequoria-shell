hl.config({
	general = {

		gaps_in = 7,
		gaps_out = 13,
		border_size = 0,

		col = {
			active_border =   "rgba(000000FF)",
			inactive_border = "rgba(000000FF)",
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
			passes = 2,
		},

		shadow = {
			enabled = true,
			range = 7,
			render_power = 4,
			color = 0xFF000000,
		},

		glow = {
			enabled = false,
			range = 7,
			render_power = 4,
			color = 0xFF8000ff,
		},

		motion_blur = {
			enabled = true,
			samples = 7,
		}
	},

	animations = {
		enabled = true,
	},
})
