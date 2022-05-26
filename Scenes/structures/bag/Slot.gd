extends Panel

onready var robot := $Robot

var robotIndexInBag := -1

signal slot_bag_cliked(robotIndexClicked)

func _ready():
	robot.visible = false
	$lvl.visible = false
	$Stats.visible = false

func addRobot(robotIndex: int):
	robotIndexInBag = robotIndex
	
	var robotBag = State.bag[robotIndex]
	robot.init(robotBag["name"], robotBag["lvl"])
	
	var robotConfig = Robots.robots[robotBag["name"]]["lvls"][robotBag["lvl"]]
	$Stats.setInitialStats(robotConfig)
	
	$lvl/Label.text = "lvl "+str(robotBag["lvl"])
	
	robot.visible = true
	$lvl.visible = true
	$Stats.visible = true

func _on_Slot_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if robotIndexInBag >= 0:
			 emit_signal("slot_bag_cliked", robotIndexInBag)
