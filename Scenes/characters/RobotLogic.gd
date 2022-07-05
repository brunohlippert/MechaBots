extends KinematicBody2D

var currentLvl: int
var isEnemy: bool

var life: int
var damage: int
var special: int

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
	damage = robotConfig["damage"]
	special = robotConfig["special"]
	
	$Stats.setInitialStats(robotConfig)
	for rob in get_node("sprites").get_children():
		rob.visible = false
	
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
	$Stats.updateLife(life)

func finishGettingDamage():
	isGettingDamage = false
	setMyTurn(true)

func playSparks():
	$Sparks.play()
	
func resetSparks():
	$Sparks.stop()
	$Sparks.frame = 0
