extends Node2D

@export var cheese_scene: PackedScene
@export var emit_interval: float = 0.006
@export var arc_speed_range := Vector2(3000, 5000)
@export var arc_angle_range := Vector2(10, -50) # slight randomness

var timer := 0.0

func _process(delta):
	timer += delta
	if timer >= emit_interval:
		timer = 0
		emit_cheese()

func emit_cheese():
	cheese_scene = load("res://Scripts/cheese.tscn")
	var cheese = cheese_scene.instantiate()
	add_child(cheese)
	cheese.global_position = global_position + Vector2(-275, -80)

	var angle_deg = randf_range(arc_angle_range.x, arc_angle_range.y)
	var speed = randf_range(arc_speed_range.x, arc_speed_range.y)
	var direction = Vector2(1, -1).normalized().rotated(deg_to_rad(angle_deg))
	cheese.linear_velocity = direction * speed
