extends Node

const robotsList = ["cannon", "fighter", "garry", "stronk"]

const robots = {
	"cannon": {
		"sprite": "res://assets/robots/cannon.png",
		"lvls": {
			1: {
				"damage": 25,
				"special": 60,
				"life": 70
			},
			2: {
				"damage": 35,
				"special": 80,
				"life": 90
			},
			3: {
				"damage": 50,
				"special": 100,
				"life": 110
			}
		}
	},
	"fighter": {
		"sprite": "res://assets/robots/fighter.png",
		"lvls": {
			1: {
				"damage": 20,
				"special": 50,
				"life": 90
			},
			2: {
				"damage": 30,
				"special": 60,
				"life": 115
			},
			3: {
				"damage": 45,
				"special": 80,
				"life": 140
			}
		}
	},
	"garry": {
		"sprite": "res://assets/robots/garry.png",
		"lvls": {
			1: {
				"damage": 15,
				"special": 90,
				"life": 60
			},
			2: {
				"damage": 25,
				"special": 115,
				"life": 80
			},
			3: {
				"damage": 40,
				"special": 130,
				"life": 100
			}
		}
	},
	"stronk": {
		"sprite": "res://assets/robots/stronk.png",
		"lvls": {
			1: {
				"damage": 15,
				"special": 40,
				"life": 130
			},
			2: {
				"damage": 25,
				"special": 70,
				"life": 160
			},
			3: {
				"damage": 40,
				"special": 90,
				"life": 190
			}
		}
	}
}
