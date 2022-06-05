extends Node2D

var specialTimeout := 2
var enemy: Dictionary

func _ready() -> void:
	# Reseta controle de pos batalha
	State.isRobotForBattleLvlUp = false
	State.isNewRobotAdded = false
	
	var robot = State.bag[State.robotForBattle]
	enemy = State.enemyForBattle
	
	$Robot.init(robot["name"], robot["lvl"], true)
	$Enemy.init(enemy["name"], enemy["lvl"], true, true)
	
	$Robot.setMyTurn(true)
	
	$Special/timeout.text = str(specialTimeout)

func _on_Attack_pressed() -> void:
	disabledButtonStates(true)
	$Enemy.getDamage($Robot.damage)  
	$Robot.setMyTurn(false)
	
	specialTimeout = specialTimeout - 1 if specialTimeout > 0 else 0
	$Special/timeout.text = str(specialTimeout)

func _on_Special_pressed() -> void:
	disabledButtonStates(true)
	$Enemy.getDamage($Robot.special)  
	$Robot.setMyTurn(false)
	
	specialTimeout = 2
	$Special/timeout.text = str(specialTimeout)

func _process(delta: float) -> void:
	# Depois de todas as animacoes de dano
	if not $Enemy.isGettingDamage and not $Robot.isGettingDamage:
		checkBattleEnded()
	
	# Vez do inimigo
	if $Enemy.isMyTurn and not $Enemy.isGettingDamage:
		$Robot.getDamage($Enemy.damage)
		$Enemy.setMyTurn(false)
		
	if $Robot.isMyTurn:
		disabledButtonStates(false)
		if specialTimeout > 0:
			$Special.disabled = true
		elif specialTimeout <= 0:
			$Special.disabled = false

func checkBattleEnded():
	if $Enemy.life <= 0:
		State.firstBattle = false
		State.handleVitoria(enemy)
		get_tree().change_scene("res://Scenes/map/Map.tscn")
	if $Robot.life <= 0:
		get_tree().change_scene("res://Scenes/map/Map.tscn")


func disabledButtonStates(newState: bool):
	$Attack.disabled = newState;
	$Special.disabled = newState;
