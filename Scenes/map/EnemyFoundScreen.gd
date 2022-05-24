extends Node2D

var rng = RandomNumberGenerator.new()

var enemyLevel: int
var enemyName: String

func _ready():
	rng.randomize()
	pickRandomEnemy()

func pickRandomEnemy():
	if State.firstBattle:
		enemyLevel = 1
		enemyName = "stronk"
	else:
		enemyLevel = rng.randi_range(1, 3)
		enemyName = Robots.robotsList[rng.randi_range(0, 3)]
	
	$Enemy.init(enemyName, enemyLevel, true, true)
