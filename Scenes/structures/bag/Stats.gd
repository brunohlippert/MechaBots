extends Node2D

func setInitialStats(stats: Dictionary):
	$damage.text = str(stats["damage"])
	$life.text = str(stats["life"])
	$special.text = str(stats["special"])

func updateLife(life: int):
	$life.text = str(life)
