extends Node2D

var nSlots = 4

func _ready() -> void:
	fillBagSlots()

func fillBagSlots():
	var bag = State.bag
	for n in nSlots:
		if n < len(State.bag):
			var robot = bag[n]
			get_node("Slot"+str(n)).addRobot(robot["name"], robot["lvl"])
