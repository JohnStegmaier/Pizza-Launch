extends CharacterBody2D

var is_in_idle_state : bool
var is_in_throwing_state : bool
var is_in_thrown_state : bool
var is_dropped : bool
var pizza_throw_charge_meter : float
var pizza_throw_arc : float

var idle_animation_hover_amount : int

func _ready() -> void:
	is_dropped = false
	pizza_throw_arc = 0
	pizza_throw_charge_meter = 0
	is_in_throwing_state = false
	is_in_thrown_state = false
	idle_animation_hover_amount = 0
	position = Vector2(220,120)
	is_in_idle_state = true
	Logger.log_debug("x: %s y: %s" % [position.x, position.y])
	
func _physics_process(delta: float) -> void:
	Logger.log_debug("x: %s y: %s" % [position.x, position.y])
	if(is_in_throwing_state):
		pizza_throw_charge_meter += 1
		Logger.log_debug("Pizza charge at: %s" % [pizza_throw_charge_meter])
	if is_in_idle_state:
		_handle_idle_animation()
	if is_in_thrown_state:
		position.y += _pizza_throw()
		if(pizza_throw_arc >= 360):
			pizza_throw_arc = 0
			pizza_throw_charge_meter = 0
			is_in_thrown_state = false
			is_in_idle_state = true 	

func _handle_idle_animation() -> void:
	idle_animation_hover_amount += 1
	if idle_animation_hover_amount > 360:
		idle_animation_hover_amount = 0
	Logger.log_debug("Is in idle state and adding %s to y value." % [sin(deg_to_rad(idle_animation_hover_amount))])	
	position.y += (sin(deg_to_rad(idle_animation_hover_amount)))
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		_handle_pizza_throwing()
		
	if event.is_action_released("ui_accept"):
		_handle_pizza_thrown()
		

func _handle_pizza_throwing():
	if(is_in_idle_state):
		is_in_throwing_state = true
		is_in_idle_state = false
	
func _handle_pizza_thrown():
	if(is_in_throwing_state):
		is_in_thrown_state = true
		is_in_throwing_state = false
		
func _pizza_throw() -> float:
	pizza_throw_arc += 1
	Logger.log_debug("Pizza throw arc at: %s" % [pizza_throw_arc])
	Logger.log_debug("Returning: %s" % [sin(deg_to_rad(pizza_throw_arc)) * pizza_throw_charge_meter])
	return (-sin(deg_to_rad(pizza_throw_arc)) * pizza_throw_charge_meter)/10
	
			
