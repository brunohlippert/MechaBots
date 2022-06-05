extends Area2D

var rng = RandomNumberGenerator.new()

const CHANCE_OF_FOUNDING_ENEMY = 0.2

# Quando o jogador voltar para o mapa, nao deixa achar um inimigo no mesmo entulho logo que o mapa abre
var playerJustFoundEnemy = false

func _ready():
	rng.randomize()
	
func _on_Entulho_body_entered(body: Node) -> void:
	if body.name == "Player":
		var foundEnemy = rng.randf_range(0.0, 1.0)
		if (foundEnemy < CHANCE_OF_FOUNDING_ENEMY and not playerJustFoundEnemy) or State.firstBattle:
			playerJustFoundEnemy = true
			get_tree().change_scene("res://Scenes/map/EnemyFoundScreen.tscn")
		else:
			playerJustFoundEnemy = false
