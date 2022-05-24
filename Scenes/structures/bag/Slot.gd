extends Panel

onready var robot := $Robot

func _ready():
	robot.visible = false
	$lvl.visible = false
	$Stats.visible = false

func addRobot(robotName: String, lvl: int):
	robot.init(robotName, lvl)
	
	var robotConfig = Robots.robots[robotName]["lvls"][lvl]
	$Stats.setInitialStats(robotConfig)
	
	$lvl/Label.text = "lvl "+str(lvl)
	
	robot.visible = true
	$lvl.visible = true
	$Stats.visible = true
