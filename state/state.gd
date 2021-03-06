extends Node

# Posicao inicial do jogador. Controla onde ele deve voltar no mapa depois da batalha
var playerPositionOnMap = Vector2(266, 374)

# Define o primeiro inimigo statico
var firstBattle = true

var playerCanMove = true

var bossBattle = false

var playerWinBossBattle = false

# Controle de pos batalha
var isRobotForBattleLvlUp = false
var isNewRobotAdded = false

# Index do robo na bag
var robotForBattle = 0

var enemyForBattle = {
	"name": "stronk",
	"lvl" : 1
}

const BAG_MAX_SLOTS = 4

var bag = [
	{
		"name": "garry",
		"lvl": 1
	}
]

func handleVitoria(enemy: Dictionary):
	if State.bossBattle:
		State.bossBattle = false
		State.playerWinBossBattle = true
	else:
		firstBattle = false
		
		if bag[robotForBattle]["lvl"] < 3:
			isRobotForBattleLvlUp = true
			bag[robotForBattle]["lvl"] += 1
		
		var robotIndex = getRobotIndexInBag(enemy)
		
		if robotIndex == -1 and len(bag) < BAG_MAX_SLOTS:
			isNewRobotAdded = true
			bag.push_back({
				"name": enemy["name"],
				"lvl": enemy["lvl"]
			})
	
func getRobotIndexInBag(robotCheck: Dictionary) -> int:
	for i in range(len(bag)):
		var robot = bag[i]
		if robot["name"] == robotCheck["name"]:
			return i
	return -1
