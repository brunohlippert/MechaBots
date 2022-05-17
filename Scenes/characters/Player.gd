extends KinematicBody2D

export var SPEED = 250
var velocity = Vector2()
onready var sprite := $AnimatedSprite

func get_input():
	var d := Vector2.ZERO
	
	d.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	d.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	
	if d.y > 0:
		sprite.play("down")
	elif d.y < 0:
		sprite.play("up")
	elif d.x > 0:
		sprite.play("right")
	elif d.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
		sprite.frame = 0
		
	return d
		
func _physics_process(delta):
	move8way(get_input().normalized(), delta)

func move8way(input: Vector2, delta: float) -> void:
	position += input * SPEED * delta
	
