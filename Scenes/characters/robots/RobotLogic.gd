extends KinematicBody2D

export var life := 100
export var damage := 25

var levels := {
	1: {
		life: 100,
		damage: 25		
	},
	2: {
		life: 150,
		damage: 30		
	}
}

var isGettingDamage := false
var isMyTurn := false

onready var animationPlayer := $AnimationPlayer
onready var turnArrow := $TurnArrow

func _ready() -> void:
	
	turnArrow.visible = false
	$Life.text = str(life)
	
func setMyTurn(value: bool):
	isMyTurn = value
	turnArrow.visible = value
	
func getDamage(dam: int):
	isGettingDamage = true;
	animationPlayer.play("damage")
	life -= dam
	$Life.text = str(life)

func finishGettingDamage():
	isGettingDamage = false
	setMyTurn(true)
