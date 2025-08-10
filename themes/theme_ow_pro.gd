@tool
extends ProgrammaticTheme

# Metadata
const UPDATE_ON_SAVE = true
const VERBOSITY = Verbosity.QUIET
var save_path_light := "res://themes/generated/ow_pro_light.tres"
var save_path_dark := "res://themes/generated/ow_pro_dark.tres"

#Default theme colors (overriden in setup_light/dark)
var theme_primary := Color.DEEP_PINK
var theme_secondary := Color.DEEP_PINK
var theme_background := Color.DEEP_PINK
var theme_foreground := Color.DEEP_PINK

# Defaults
var default_hover := 0.05
var default_hover_font_darken := 0.5

var default_font := "res://themes/fonts/BRLNSR.TTF"
var default_font_size := 24

var default_border_darken := 0
var default_border_width := 12
var default_focus_border_width := 10

var default_corner_radius := 0

var default_expand_margin := default_border_width

var default_shadow_offset := Vector2(0,0)
var default_shadow_size := 0
var default_shadow_color := Color.DEEP_PINK

var default_skew := Vector2(0,0)

# Button
var button_border_width = 0
var button_content_margin_v := 24
var button_content_margin_h := 12
var button_expand_margin_v := 0
var button_expand_margin_h := 0
var button_hover_size := 4

# Label
var label_outline_size := 10

# Panel
var panel_inner_margin := 24
var panel_border_width := default_border_width

func setup_dark():
	set_save_path(save_path_dark)
	theme_primary = Color("#40bfb3")
	theme_secondary = Color("#bf405e")
	theme_background = Color("#000000")
	theme_foreground = Color("#FFFFFF")
	default_shadow_color = theme_foreground.darkened(0.2)
	
func setup_light():
	set_save_path(save_path_light)
	theme_primary = Color("#40bfb3")
	theme_secondary = Color("#bf405e")
	theme_background = Color("#FFFFFF")
	theme_foreground = Color("#000000")
	default_shadow_color = theme_secondary.lightened(0.2)

func define_theme():
	define_default_font(ResourceLoader.load(default_font))
	define_default_font_size(default_font_size)
	
	# Vars referencing `theme_` colors must be instantiated in `define_theme()`
	var default_border_color := theme_foreground
	var default_font_color := theme_foreground
	var default_font_focus_color := theme_background
	var button_hover_color := default_shadow_color

	
	var default_style = stylebox_flat({
		anti_aliasing = true,
		anti_aliasing_size = 1.0,
		bg_color = theme_background,
		border_blend = false,
		border_color = default_border_color,
		border_width_ = border_width(default_border_width),
		corner_detail = 8,
		corner_radius_ = corner_radius(default_corner_radius),
		draw_center = true,
		expand_margin_ = expand_margins(default_expand_margin),
		shadow_color = default_shadow_color,
		shadow_offset = default_shadow_offset,
		shadow_size = default_shadow_size,
		skew = default_skew,
	})
	
	var button_style = inherit(default_style, {
		#skew = Vector2(0.1,0.01),
		border_width_ = border_width(button_border_width),
		content_margin_ = content_margins(button_content_margin_h, button_content_margin_v),
		corner_radius_ = corner_radius(0,0,0,0),
		expand_margin_ = expand_margins(button_expand_margin_h, button_expand_margin_v)
	})
	
	define_style("Button", {
		normal = button_style,
		font_color = default_font_color,
		
		hover = inherit(button_style, {
			shadow_size = button_hover_size,
		}),
		
		focus = inherit(button_style, {
			border_width_ = border_width(0,0,0,10),
			border_color = theme_secondary,
			#expand_margin_ = expand_margins(default_shadow_size + default_focus_border_width),
			draw_center = false,
			shadow_size = 0,
		}),
		
		pressed = inherit(button_style, {
			bg_color = theme_primary
		}),
		hover_pressed = inherit(button_style, {
			bg_color = theme_primary,
			shadow_size = button_hover_size,
		}),
		font_pressed_color = theme_background,
		font_hover_pressed_color = theme_background,
		
		disabled = inherit(button_style, {
		}),
		
	})
	
	define_style("CheckButton", {
		
	})
	
	define_style("PanelContainer", {
		panel = inherit(default_style, {
			bg_color = theme_primary.darkened(0.9),
			#content_margin_ = content_margins(panel_border_width + panel_inner_margin),
		}),
	})
	
	define_style("Panel", {
		panel = inherit(default_style, {
			bg_color = theme_primary.darkened(0.9),
			#content_margin_ = content_margins(panel_border_width + panel_inner_margin),
		}),
	})
	
	define_style("Label", {
		font_color = default_font_color,
	})
	
	define_variant_style("LabelInverse", "Label", {
		font_color = theme_background,
		font_outline_color = theme_background,
		outline_size = label_outline_size,
	})
	
	define_variant_style("LabelCaption", "Label", {
		font_color = default_font_color,
		font_outline_color = theme_background,
		outline_size = label_outline_size,
	})
	
	define_style("VBoxContainer", {
		separation = 12,
	})
	
	define_style("HBoxContainer", {
		separation = 12,
	})
