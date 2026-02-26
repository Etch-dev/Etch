class_name AboutDialog
extends PanelContainer

@export var _version: Label
@export var _github: LinkButton
@export var _license: LinkButton
@export var _godot: LinkButton
@export var _kenny: LinkButton
@export var _remix_icons: LinkButton

func _ready() -> void:
	get_parent().close_requested.connect(get_parent().hide)
	_version.text = "Etch v%s" % Config.VERSION_STRING
	_github.pressed.connect(func() -> void: OS.shell_open("https://github.com/Etch-dev/Etch"))
	_license.pressed.connect(func() -> void: OS.shell_open("https://github.com/Etch-dev/Etch/blob/main/LICENSE"))
	_godot.pressed.connect(func() -> void: OS.shell_open("https://godotengine.org/"))
	_kenny.pressed.connect(func() -> void: OS.shell_open("https://www.kenney.nl/assets/platformer-art-deluxe"))
	_remix_icons.pressed.connect(func() -> void: OS.shell_open("https://remixicon.com/"))
