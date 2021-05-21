extends Label

func _ready():
	text = str(0)

func _update(minigame):
	text = str(minigame.score)
