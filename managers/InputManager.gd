extends Node
class_name InputManager

signal entered_target_mode()
signal exited_target_mode()
signal entity_targeted(entity: TargetableComponent)

var _target_mode := false

func toggle_target_mode() -> void:
	_target_mode = not _target_mode
	if _target_mode:
		emit_signal("entered_target_mode")
	else:
		emit_signal("exited_target_mode")

func set_target_mode(mode: bool) -> void:
	if _target_mode != mode:
		_target_mode = mode
		if _target_mode:
			emit_signal("entered_target_mode")
		else:
			emit_signal("exited_target_mode")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_target_mode"):
		toggle_target_mode()
