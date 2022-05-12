extends KinematicBody2D


export var life := 100
export var damage := 25
onready var tween := $DamageTween

func _ready() -> void:
	$Life.text = str(life)
	
func getDamage(dam: int):
	
	life -= dam
	$Life.text = str(life)
