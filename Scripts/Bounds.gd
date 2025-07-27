extends ColorRect

func _ready():
	size = get_viewport_rect().size
	color = Color(1, 0, 0, 0.1) # semi-transparent red
