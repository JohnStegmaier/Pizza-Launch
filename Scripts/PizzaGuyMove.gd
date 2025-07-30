extends Node2D
@onready var pizza := get_node("../Pizza")
@export var speed := 600

func _process(delta):
	var direction := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	position.x += direction * speed * delta
	if pizza:
		if(pizza.is_in_idle_state):
			pizza.position.x += (direction * speed * delta)
