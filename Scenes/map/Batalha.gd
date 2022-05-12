extends Node2D


var isPlayerTurn := true

func _ready() -> void:
	pass # Replace with function body.

func _on_Attack_pressed() -> void:
	$AtacksMenu/Attack.disabled = true;
	$Enemy.getDamage($Robot.damage)  
	checkBattleEnded()
	isPlayerTurn = not isPlayerTurn

func _process(delta: float) -> void:
	if not isPlayerTurn:
		$Robot.getDamage($Enemy.damage)
		isPlayerTurn = not isPlayerTurn
		$AtacksMenu/Attack.disabled = false;
		

func checkBattleEnded():
	if($Enemy.life <= 0 || $Robot.life <= 0):
		get_tree().change_scene("res://Scenes/map/Map.tscn")
