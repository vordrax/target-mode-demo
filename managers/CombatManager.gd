extends Node
class_name CombatManager

@export var input_manager: InputManager

var _target_mode := false

func register(component: Node) -> void:
	if component is HealthComponent:
		print(self, " registering HealthComponent ", component)
		component.died.connect(_on_health_died.bind(component))
		return
	if component is TargetableComponent:
		print(self, " registering TargetableComponent ", component)
		component.targeted.connect(_on_targetable_targeted.bind(component))
		return

func _on_targetable_targeted(targetable: TargetableComponent) -> void:
	if not _target_mode:
		return
	for child in targetable.get_parent().get_children():
		if child is HealthComponent:
			child.deal_damage(5)
			break
	input_manager.set_target_mode(false)

func _on_health_died(component: HealthComponent) -> void:
	var parent := component.get_parent()
	print(parent, " died")
	parent.queue_free()

func _ready() -> void:
	input_manager.connect("entered_target_mode", _on_entered_target_mode)
	input_manager.connect("exited_target_mode", _on_exited_target_mode)

func _on_entered_target_mode() -> void:
	_target_mode = true

func _on_exited_target_mode() -> void:
	_target_mode = false
