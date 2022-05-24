extends KinematicBody2D

var currentLvl: int
var isEnemy: bool
var life: int

var isGettingDamage := false
var isMyTurn := false

onready var animationPlayer := $AnimationPlayer
onready var turnArrow := $TurnArrow
onready var stats := $Stats

var robotSprite

func _ready() -> void:
	turnArrow.visible = false
	
func init(robot: String, lvl: int, statsVisible=false, _isEnemy=false):
	var robotConfig = Robots.robots[robot]["lvls"][lvl]
	
	isEnemy = _isEnemy
	currentLvl = lvl
	life = robotConfig["life"]
	
	$Stats.setInitialStats(robotConfig)
	robotSprite = get_node("sprites/"+robot)
	
	if isEnemy:
		robotSprite.set_flip_h(true)
	
	robotSprite.visible = true
	$Stats.visible = statsVisible
	
func setMyTurn(value: bool):
	isMyTurn = value
	turnArrow.visible = value
	
func getDamage(dam: int):
	isGettingDamage = true;
	animationPlayer.play("damage")
	life -= dam

func finishGettingDamage():
	isGettingDamage = false
	setMyTurn(true)
