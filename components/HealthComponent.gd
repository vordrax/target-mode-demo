extends Node
class_name HealthComponent

signal took_damage(damage: int)
signal died()

@export var max_health: int = 20

@onready var current_health: int = max_health

func deal_damage(damage: int) -> void:
	current_health -= damage
	emit_signal("took_damage", damage)
	if current_health <= 0:
		emit_signal("died")

func _ready() -> void:
	get_tree().call_group("managers", "register", self)
