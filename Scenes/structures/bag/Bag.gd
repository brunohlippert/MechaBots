extends Node2D

var nSlots = 4

func _ready() -> void:
	fillBagSlots()

func fillBagSlots():
	for n in nSlots:
		if n < len(State.bag):
			get_node("Slot"+str(n)).addRobot(n)
