extends Node2D

func _ready() -> void:
	var robot = State.bag[State.robotForBattle]
	var enemy = State.enemyForBattle
	$Robot.init(robot["name"], robot["lvl"], true)
	$Enemy.init(enemy["name"], enemy["lvl"], true, true)
	
	$Robot.setMyTurn(true)

func _on_Attack_pressed() -> void:
	$Attack.disabled = true;
	$Enemy.getDamage($Robot.damage)  
	$Robot.setMyTurn(false)

func _on_Special_pressed() -> void:
	$Attack.disabled = true;
	$Enemy.getDamage($Robot.special)  
	$Robot.setMyTurn(false)

func _process(delta: float) -> void:
	# Depois de todas as animacoes de dano
	if not $Enemy.isGettingDamage and not $Robot.isGettingDamage:
		checkBattleEnded()
	
	# Vez do inimigo
	if $Enemy.isMyTurn and not $Enemy.isGettingDamage:
		$Robot.getDamage($Enemy.damage)
		$Enemy.setMyTurn(false)
		
	if $Robot.isMyTurn:
		$Attack.disabled = false;
		
func checkBattleEnded():
	if($Enemy.life <= 0 || $Robot.life <= 0):
		get_tree().change_scene("res://Scenes/map/Map.tscn")
