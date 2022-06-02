extends Node2D

func _on_bagButton_pressed() -> void:
	$Bag.visible = not $Bag.visible
