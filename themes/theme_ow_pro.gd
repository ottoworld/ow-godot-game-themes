@tool
extends ProgrammaticTheme

# Metadata
const UPDATE_ON_SAVE = true
const VERBOSITY = Verbosity.QUIET
var save_path_light := "res://themes/generated/ow_pro_light.tres"
var save_path_dark := "res://themes/generated/ow_pro_dark.tres"

#Theme colors
var theme_primary := Color.DEEP_PINK
var theme_secondary := Color.DEEP_PINK
var theme_background := Color.DEEP_PINK
var theme_foreground := Color.DEEP_PINK

# Defaults
var default_hover := 0.05

var default_font := "res://themes/fonts/BRLNSR.TTF"
var default_font_size := 36
var default_font_color := theme_foreground
var default_font_color_hover := theme_foreground

var default_border_darken := 0
var default_border_color := theme_primary.darkened(default_border_darken)
var default_border_width := 12

var default_corner_radius := 12

# Button
var button_font_color := default_font_color
var button_font_hover_color := button_font_color.darkened(default_hover)

func setup_dark():
	theme_primary = Color("#40bfb3")
	theme_secondary = Color("#bf405e")
	theme_background = Color("#000000")
	theme_foreground = Color("#FFFFFF")
	set_save_path(save_path_dark)
	
func setup_light():
	theme_primary = Color("#40bfb3")
	theme_secondary = Color("#bf405e")
	theme_background = Color("#FFFFFF")
	theme_foreground = Color("#000000")
	set_save_path(save_path_light)

func define_theme():
	define_default_font(ResourceLoader.load(default_font))
	define_default_font_size(default_font_size)
	
	var default_style = stylebox_flat({
		anti_aliasing = true,
		anti_aliasing_size = 1.0,
		bg_color = theme_background,
		border_blend = true,
		border_color = default_border_color,
		border_width_ = border_width(default_border_width),
		corner_detail = 8,
		corner_radius_ = corner_radius(default_corner_radius),
		draw_center = true
	})
	
	define_style("Button", {
		normal = inherit(default_style, {
			bg_color = Color.BROWN
		})
	})
	
	define_style("Panel", {
		panel = default_style
	})
