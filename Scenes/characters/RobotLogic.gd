extends KinematicBody2D

var life
var damage
var currentLvl

var levels := {
	1: {
		"life": 100,
		"damage": 25
	},
	2: {
		"life": 150,
		"damage": 30
	}
}

var isGettingDamage := false
var isMyTurn := false

onready var animationPlayer := $AnimationPlayer
onready var turnArrow := $TurnArrow
onready var robotSprite = get_node("RobotSprite")

func _ready() -> void:
	turnArrow.visible = false
	
func init(lvl: int):
	damage = levels[lvl].damage
	life = levels[lvl].life
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
