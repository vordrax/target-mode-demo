extends Button

@export var input_manager: InputManager

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	if input_manager:
		input_manager.set_target_mode(true)
