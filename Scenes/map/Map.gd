extends Node2D

func _ready():
	$Player.position = State.playerPositionOnMap
	
	if State.playerWinBossBattle:
		for child in $BarreiraBau.get_children():
			$BarreiraBau.remove_child(child)
		

func _on_bagButton_pressed() -> void:
	$HudLayer/Bag.visible = not $HudLayer/Bag.visible

	State.playerCanMove = not $HudLayer/Bag.visible
