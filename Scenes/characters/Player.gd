extends KinematicBody2D

export var SPEED = 250
var velocity = Vector2()


func get_input():
	var d := Vector2.ZERO
	
	d.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	d.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	return d
		
func _physics_process(delta):
	move8way(get_input().normalized(), delta)

func move8way(input: Vector2, delta: float) -> void:
	position += input * SPEED * delta
	
