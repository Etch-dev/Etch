class_name NewPaletteDialog
extends MarginContainer

signal new_palette_created(palette: Palette)

@export var _line_edit: LineEdit

var duplicate_current_palette := false


func _ready() -> void:
	get_parent().about_to_popup.connect(_on_about_to_popup)
	get_parent().close_requested.connect(_on_close_requested)


func _on_save_button_pressed() -> void:
	var pallete_name := _line_edit.text
	if not pallete_name.is_empty():
		var palette: Palette
		if duplicate_current_palette:
			palette = PaletteManager.duplicate_palette(PaletteManager.get_active_palette(), pallete_name)
		else:
			palette = PaletteManager.create_custom_palette(pallete_name)

		if palette:
			PaletteManager.save()
			new_palette_created.emit(palette)
			duplicate_current_palette = false
			get_parent().hide()


func _on_cancel_button_pressed() -> void:
	_line_edit.clear()
	get_parent().hide()


func _on_close_requested() -> void:
	_line_edit.clear()
	get_parent().hide()


func _on_about_to_popup() -> void:
	# Set title
	if duplicate_current_palette:
		get_parent().title = tr("NEW_PALETTE_DIALOG_DUPLICATE_TITLE")
	else:
		get_parent().title = tr("NEW_PALETTE_DIALOG_CREATE_TITLE")

	_line_edit.grab_focus()
