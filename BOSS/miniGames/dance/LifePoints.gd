extends Label

func _ready():
	text = str(3)

func _update(minigame):
	print("se actualizo")
	text = str(minigame.life_remaining)
