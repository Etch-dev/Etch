class_name ColorPalettePicker
extends PanelContainer

const PALETTE_BUTTON = preload("res://UI/Components/PaletteButton.tscn")

signal color_changed(color: Color)
signal closed

@export var add_new_palette_dialog_path: NodePath
@export var edit_palette_dialog: NodePath
@export var delete_palette_dialog: NodePath
@export var toolbar_path: NodePath

@onready var _toolbar: Toolbar = get_node(toolbar_path)
@export var _palette_selection_button: OptionButton
@export var _color_grid: GridContainer

var _active_palette_button: PaletteButton
var _active_color_index := -1

func _ready() -> void:
	update_palettes()


func _input(event: InputEvent) -> void:
	if not visible:
		return

	if event is InputEventMouseButton and event.pressed:
		var should_hide: bool = not (Utils.is_mouse_in_control(self)
			or Utils.is_mouse_in_control(_toolbar.get_brush_color_button())
			or get_parent().is_dialog_open()
			or _palette_selection_button.get_popup().visible
			or AlertDialog.visible)
		if should_hide:
			_close()
	elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		_close()


func get_active_color() -> Color:
	if _active_palette_button:
		return _active_palette_button.color
	return Color.WHITE


func get_active_color_index() -> int:
	return _active_color_index


func update_palettes(color_index: int = 0) -> void:
	# Add palettes to the dropdown
	_palette_selection_button.clear()
	for palette in PaletteManager.palettes:
		_palette_selection_button.add_item(palette.name)

	# Load the active palette
	var active_palette := PaletteManager.get_active_palette()
	_palette_selection_button.selected = PaletteManager.get_active_palette_index()
	_create_buttons(active_palette)
	_activate_palette_button(_color_grid.get_child(color_index), color_index)


func _close() -> void:
	for btn in _color_grid.get_children():
		btn.clear_hover_state()
	hide()
	closed.emit()


func _create_buttons(palette: Palette) -> void:
	# Remove old buttons
	_active_palette_button = null
	for c: PaletteButton in _color_grid.get_children():
		_color_grid.remove_child(c)
		c.queue_free()

	# Add new ones
	var index := 0
	for color in palette.colors:
		var button: PaletteButton = PALETTE_BUTTON.instantiate()
		_color_grid.add_child(button)
		button.color = color
		button.pressed.connect(_on_platte_button_pressed.bind(button, index))
		index += 1

	# Adjust ui size
	size = get_combined_minimum_size()


func _activate_palette_button(button: PaletteButton, color_index: int) -> void:
	if _active_palette_button:
		_active_palette_button.selected = false
	_active_palette_button = button
	_active_color_index = color_index
	_active_palette_button.selected = true


func _on_platte_button_pressed(button: PaletteButton, index: int) -> void:
	_activate_palette_button(button, index)
	color_changed.emit(button.color)


func _on_palette_selection_button_item_selected(index: int) -> void:
	PaletteManager.set_active_palette_by_index(index)
	PaletteManager.save()

	var palette := PaletteManager.get_active_palette()
	_create_buttons(palette)
	_activate_palette_button(_color_grid.get_child(0), 0)
	_adjust_position()


func _on_add_palette_button_pressed() -> void:
	var dialog: NewPaletteDialog = get_node(add_new_palette_dialog_path)
	dialog.duplicate_current_palette = false
	dialog.get_parent().popup_centered()


func _on_edit_color_button_pressed() -> void:
	var palette := PaletteManager.get_active_palette()
	if palette.builtin:
		AlertDialog.dialog_text = tr("ALERT_EDITING_BUILTIN_PALETTE")
		AlertDialog.popup_centered()
	else:
		hide()
		var edit_popup: EditPaletteDialog = get_node(edit_palette_dialog)
		edit_popup.setup(PaletteManager.get_active_palette(), _active_color_index)
		edit_popup.get_parent().popup_centered()


func _on_duplicate_palette_button_pressed() -> void:
	var dialog: NewPaletteDialog = get_node(add_new_palette_dialog_path)
	dialog.duplicate_current_palette = true
	dialog.get_parent().popup_centered()


func _on_delete_palette_button_pressed() -> void:
	if PaletteManager.get_active_palette().builtin:
		AlertDialog.dialog_text = tr("ALERT_DELETING_BUILTIN_PALETTE")
		AlertDialog.popup_centered()
	else:
		var dialog: DeletePaletteDialog = get_node(delete_palette_dialog)
		dialog.get_parent().popup_centered()


func toggle() -> void:
	visible = not visible
	_adjust_position()


func _adjust_position() -> void:
	var color_button_position: float = _toolbar.get_brush_color_button().position.x
	# If palette extends beyond the window
	if color_button_position + size.x > _toolbar.size.x:
		var size_offset: int = _toolbar.size.x - size.x
		# If window size is big enough to show the entire palette (horizontally)
		if size_offset >= 0:
			position.x = size_offset
		elif _color_grid.get_combined_minimum_size().x < _toolbar.size.x:
			position.x = 0
		else:
			var color_button_size: float = _toolbar.get_brush_color_button().size.x
			# Brackets = Distance of window center from left side of color button
			# Distance / size = ratio where (0 <= ratio <= 1) scrolls through color picker
			# (ratio < 0) clamps to left side of color picker, (ratio > 1) clamps to right side
			var interval_position: float = (_toolbar.scroll_horizontal + _toolbar.size.x / 2 - color_button_position) / color_button_size * size_offset
			position.x = clamp(interval_position, size_offset, 0)
	elif position.x != color_button_position:
		position.x = color_button_position - _toolbar.scroll_horizontal
