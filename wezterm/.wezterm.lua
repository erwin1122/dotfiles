-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

-- Tab Settings
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

tab_styling = {
	tab_bar = {
		background = "#1f2329", -- bg0

		active_tab = {
			bg_color = "#3c5269", -- bg_blue (blauer Akzent)
			fg_color = "#0e1013", -- black, guter Kontrast
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#282c34", -- bg1
			fg_color = "#7a818e", -- light_grey
		},

		inactive_tab_hover = {
			bg_color = "#323641", -- bg3
			fg_color = "#a0a8b7", -- fg
		},

		new_tab = {
			bg_color = "#1f2329", -- bg0
			fg_color = "#3c5269", -- blue
		},

		new_tab_hover = {
			bg_color = "#323641", -- bg3
			fg_color = "#3c5269",
		},
	},
}
config.colors = tab_styling

-- Font Settings
config.font_size = 12
config.color_scheme = "One Dark (Gogh)"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Turn off ligatures (e.g. combined equal signs)

-- Finally, return the configuration to wezterm:
return config
