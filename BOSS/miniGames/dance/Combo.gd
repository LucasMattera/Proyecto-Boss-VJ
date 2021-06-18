extends ColorRect

onready var combo = 0
onready var description: Label = $ComboDescription
onready var multiplier: Label = $ComboFire/Multiplier
onready var fire: AnimatedSprite = $ComboFire

func _ready():
	pass # Replace with function body.

func fail(minigame):
	combo -= 1
	fire.hide()
	if combo > 0:
		combo = 0
	minigame.set_multiplier_combo(combo)
	match combo:
		0:
			description.text = ""
			description.fail()
			color = Color(0,0,0,0) # Transparent
		-1:
			description.text = "Malo"
			color = Color(0.4,0,0,0.3)
		-2:
			description.text = "De madera!"
			color = Color(0.7,0,0,0.5)
		-3:
			description.text = "Más duro que\nla realidad"
			color = Color(0,0,0,0.7)

func success(minigame):
	combo += 1
	if combo < 0:
		combo = 1
	minigame.set_multiplier_combo(combo)
	multiplier.text = str("X", combo)
	match combo:
		0:
			pass
		1:
			description.text = ""
			description.success()
			color = Color(0,0,0,0) # Transparent
		2:
			fire.show()
			description.text = "Bien piola!"
			color = Color(0,0.5,1, 0.3)
		3:
			description.show()
		4:
			description.text = "Excelente!"
			color = Color(0.5,1,0,0.5)
		5:
			description.text = "Quién te conoce,\nHernán Piquin?"
			color = Color(1,1,0,0.7)
			pass
