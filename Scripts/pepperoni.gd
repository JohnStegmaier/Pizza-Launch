extends Node2D

func _ready():
	# Optional: tilt sprite a bit for randomness
	rotation = randf_range(-0.6, 0.6)

func _on_despawn_timer_timeout() -> void:
	queue_free()
