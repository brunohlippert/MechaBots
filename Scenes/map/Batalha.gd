extends Node2D

var specialTimeout := 2
var enemy: Dictionary

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	
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
	var modifiedDamage = getDamageModified($Robot.damage, false)
	$Enemy.getDamage(modifiedDamage)  
	$Robot.setMyTurn(false)
	
	specialTimeout = specialTimeout - 1 if specialTimeout > 0 else 0
	$Special/timeout.text = str(specialTimeout)

func _on_Special_pressed() -> void:
	disabledButtonStates(true)
	var modifiedDamage = getDamageModified($Robot.special, false)
	$Enemy.getDamage(modifiedDamage)  
	$Robot.setMyTurn(false)
	
	specialTimeout = 2
	$Special/timeout.text = str(specialTimeout)

func _process(delta: float) -> void:
	# Depois de todas as animacoes de dano
	if not $Enemy.isGettingDamage and not $Robot.isGettingDamage:
		checkBattleEnded()
	
	# Vez do inimigo
	if $Enemy.isMyTurn and not $Enemy.isGettingDamage:
		var modifiedDamage = getDamageModified($Enemy.damage, false)
		$Robot.getDamage(modifiedDamage)
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
	
func getDamageModified(damage: float, isSpecial: bool):
	var damageModifier = 5 if not isSpecial else 10
	var newDamage = rng.randi_range(damage - damageModifier, damage + damageModifier)
	
	return newDamage
