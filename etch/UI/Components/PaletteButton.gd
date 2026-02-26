class_name PaletteButton
extends Control

signal pressed

@export var _color_texture: TextureRect
@export var _selection_texture: TextureRect

var selected := false: set = set_selected
var color := Color.WHITE: set = set_color

func _ready() -> void:
	_color_texture.modulate.a = 0


func set_selected(s: bool) -> void:
	selected = s
	_selection_texture.modulate = _get_selection_color() if selected else color


func clear_hover_state() -> void:
	if not selected:
		_selection_texture.modulate = color


func set_color(c: Color) -> void:
	color = c
	_color_texture.modulate = c
	if not selected:
		_selection_texture.modulate = c


func _get_selection_color() -> Color:
	return Color.BLACK


func _get_hover_color() -> Color:
	return Color.BLACK


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		pressed.emit()


func _on_mouse_entered() -> void:
	if not selected:
		_selection_texture.modulate = _get_hover_color()


func _on_mouse_exited() -> void:
	_selection_texture.modulate = _get_selection_color() if selected else color
