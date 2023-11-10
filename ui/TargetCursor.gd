extends Control

@export var input_manager: InputManager

@onready var cursor: TextureRect = $TextureRect

func _ready() -> void:
	input_manager.entered_target_mode.connect(_on_entered_target_mode)
	input_manager.exited_target_mode.connect(_on_exited_target_mode)

func _process(_delta: float) -> void:
	global_position = get_viewport().get_mouse_position()

func _on_entered_target_mode() -> void:
	cursor.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _on_exited_target_mode() -> void:
	cursor.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
