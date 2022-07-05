extends Node2D

func _on_Area2D_body_entered(body):
	State.bossBattle = true
	get_tree().change_scene("res://Scenes/map/Batalha.tscn")
