extends Area2D
class_name TargetableComponent

signal targeted()

func _ready() -> void:
	get_tree().call_group("managers", "register", self)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			emit_signal("targeted")
