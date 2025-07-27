extends Node2D

@export var pepperoni_scene: PackedScene
@export var emit_interval: float = 0.06
@export var arc_speed_range := Vector2(800, 1000)
@export var arc_angle_range := Vector2(-90, -60) # slight randomness

var timer := 0.0

func _process(delta):
	timer += delta
	if timer >= emit_interval:
		timer = 0
		emit_pepperoni()

func emit_pepperoni():
	pepperoni_scene = load("res://Scripts/Pepperoni.tscn")
	var pepperoni = pepperoni_scene.instantiate()
	add_child(pepperoni)
	pepperoni.global_position = global_position + Vector2(790, 115)

	var angle_deg = randf_range(arc_angle_range.x, arc_angle_range.y)
	var speed = randf_range(arc_speed_range.x, arc_speed_range.y)
	var direction = Vector2(1, -1).normalized().rotated(deg_to_rad(angle_deg))
	pepperoni.linear_velocity = direction * speed
