local wezterm = require("wezterm")
local config = {}
local kanagawa_lotus = require("colors.kanagawa-lotus")

-- Enables image rendering in the terminal
config.enable_kitty_graphics = true

-- Shell Config
config.default_prog = { "zsh" }

-- Color Scheme Config
-- Adding a custom colorscheme
config.color_schemes = {
	["Kanagawa Lotus"] = kanagawa_lotus,
}
-- Color schemes to toggle between.
local light_scheme = "Catppuccin Latte"
local dark_scheme = "Catppuccin Mocha"
config.color_scheme = dark_scheme

-- Taken from: https://github.com/wezterm/wezterm/discussions/5253
-- Custom event to toggle color scheme. Fire it `config.keys`.
wezterm.on("toggle-color-scheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == light_scheme then
		overrides.color_scheme = dark_scheme
	else
		overrides.color_scheme = light_scheme
	end
	window:set_config_overrides(overrides)
end)

-- Wezterm Gui Config
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "NONE"
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.max_fps = 144

-- Font Config
config.font = wezterm.font("Terminess Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" })
config.font_size = 22

-- Keybinds
config.keys = {
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "$",
		mods = "SHIFT|CTRL|ALT",
		action = wezterm.action({ EmitEvent = "toggle-color-scheme" }),
	},
}
config.window_background_opacity = 0.9
return config
