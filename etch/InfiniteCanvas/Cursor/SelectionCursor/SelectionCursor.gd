class_name SelectionCursor
extends BaseCursor

const MOVE_TEXTURE = preload("res://Assets/Cursors/move_cursor.png")
const SELECT_TEXTURE = preload("res://Assets/Textures/selection_cursor.png")

enum Mode {
	MOVE,
	SELECT
}

var mode: Mode = Mode.SELECT:
	set(m):
		mode = m
		if mode == Mode.MOVE:
			texture = MOVE_TEXTURE
		else:
			texture = SELECT_TEXTURE

func _on_zoom_changed(zoom_value: float) -> void:
	scale = Vector2.ONE / zoom_value
