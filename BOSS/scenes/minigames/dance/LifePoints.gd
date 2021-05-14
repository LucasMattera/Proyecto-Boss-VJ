extends Label

func _ready():
	text = str(3)

func _update(minigame):
	text = str(minigame.life_remaining)
