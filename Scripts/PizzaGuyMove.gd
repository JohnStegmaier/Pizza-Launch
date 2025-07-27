extends Node2D

@export var speed := 600

func _process(delta):
	var direction := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	position.x += direction * speed * delta
