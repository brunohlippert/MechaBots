extends Node2D

var rng = RandomNumberGenerator.new()

var enemyLevel: int
var enemyName: String

func _ready():
	rng.randomize()
	pickRandomEnemy()
	connectSlots()

func connectSlots():
	$Bag/Slot0.connect("slot_bag_cliked", self, "robotSelected")
	$Bag/Slot1.connect("slot_bag_cliked", self, "robotSelected")
	$Bag/Slot2.connect("slot_bag_cliked", self, "robotSelected")
	$Bag/Slot3.connect("slot_bag_cliked", self, "robotSelected")

func pickRandomEnemy():
	if State.firstBattle:
		enemyLevel = 1
		enemyName = "stronk"
	else:
		enemyLevel = rng.randi_range(1, 3)
		enemyName = Robots.robotsList[rng.randi_range(0, 3)]
	
	State.enemyForBattle["name"] = enemyName
	State.enemyForBattle["lvl"] = enemyLevel
	
	$Enemy.init(enemyName, enemyLevel, true, true)

func robotSelected(index: int):
	State.robotForBattle = index
	
	get_tree().change_scene("res://Scenes/map/Batalha.tscn")
