class_name Serializer

# TODO: !IMPORTANT! all of this needs validation

const BRUSH_STROKE = preload("res://BrushStroke/BrushStroke.tscn")
const COMPRESSION_METHOD = FileAccess.COMPRESSION_DEFLATE
const POINT_ELEM_SIZE = 3
const VERSION_NUMBER = 1
const TYPE_BRUSH_STROKE = 0
const TYPE_ERASER_STROKE_DEPRECATED = 1

static func save_project(project: Project) -> void:
	# Open file
	var file := FileAccess.open_compressed(project.filepath, FileAccess.WRITE, COMPRESSION_METHOD)
	if not file:
		printerr("Failed to open file for writing: " + error_string(FileAccess.get_open_error()))
		return

	# Meta data
	file.store_32(VERSION_NUMBER)
	file.store_pascal_string(_dict_to_metadata_str(project.meta_data))

	# Stroke data
	for stroke: BrushStroke in project.strokes:
		# Type
		file.store_8(TYPE_BRUSH_STROKE)

		# Color
		file.store_8(stroke.color.r8)
		file.store_8(stroke.color.g8)
		file.store_8(stroke.color.b8)

		# Brush size
		file.store_16(int(stroke.size))

		# Number of points
		file.store_16(stroke.points.size())

		# Points
		var p_idx := 0
		for p in stroke.points:
			# Add global_position offset which is != 0 when moved by move tool; but mostly it should just add 0
			file.store_float(p.x + stroke.global_position.x)
			file.store_float(p.y + stroke.global_position.y)
			var pressure: int = clamp(int(stroke.pressures[p_idx] * 255), 0, 255)
			file.store_8(pressure)
			p_idx += 1

	# Done
	file.close()


static func load_project(project: Project) -> void:
	# Open file
	var file := FileAccess.open_compressed(project.filepath, FileAccess.READ, COMPRESSION_METHOD)
	if not file:
		print_debug("Failed to load file: " + error_string(FileAccess.get_open_error()))
		return

	# Clear potential previous data
	project.strokes.clear()
	project.meta_data.clear()

	# Meta data
	var _version_number := file.get_32()
	var meta_data_str := file.get_pascal_string()
	project.meta_data = _metadata_str_to_dict(meta_data_str)

	# Brush strokes
	while true:
		# Type
		var type := file.get_8()

		match type:
			TYPE_BRUSH_STROKE:
				var brush_stroke: BrushStroke = BRUSH_STROKE.instantiate()

				# Color
				var r := file.get_8()
				var g := file.get_8()
				var b := file.get_8()
				brush_stroke.color = Color(r/255.0, g/255.0, b/255.0, 1.0)

				# Brush size
				brush_stroke.size = file.get_16()

				# Number of points
				var point_count := file.get_16()

				# Points
				for i: int in point_count:
					var x := file.get_float()
					var y := file.get_float()
					var pressure := float(file.get_8()) / 255.0
					brush_stroke.points.append(Vector2(x, y))
					brush_stroke.pressures.append(pressure)

				project.strokes.append(brush_stroke)
			TYPE_ERASER_STROKE_DEPRECATED:
				pass
			_:
				printerr("Invalid type")

		# are we done yet?
		if file.get_position() >= file.get_length() - 1 or file.eof_reached():
			break

	# Done
	file.close()


static func _dict_to_metadata_str(d: Dictionary) -> String:
	var meta_str := ""
	for k: Variant in d.keys():
		var v: Variant = d[k]
		if k is String and v is String:
			meta_str += "%s=%s," % [k, v]
		else:
			printerr("Metadata should be String key-value pairs only!")
	return meta_str


static func _metadata_str_to_dict(s: String) -> Dictionary:
	var meta_dict := {}
	for kv: String in s.split(",", false):
		var kv_split: PackedStringArray = kv.split("=", false)
		if kv_split.size() != 2:
			printerr("Invalid metadata key-value pair: %s" % kv)
		else:
			meta_dict[kv_split[0]] = kv_split[1]
	return meta_dict
