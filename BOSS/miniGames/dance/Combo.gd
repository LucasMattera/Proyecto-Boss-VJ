extends ColorRect

onready var combo = 0

func _ready():
	pass # Replace with function body.

func fail():
	combo -= 1
	$ComboSprite.hide()
	if combo > 0:
		combo = 0
	match combo:
		0:
			$ComboLabel.text = ""
			$ComboLabel.fail()
			color = Color(0,0,0,0) # Transparent
		-1:
			$ComboLabel.text = "Malo"
			color = Color(0.4,0,0,0.3)
		-2:
			$ComboLabel.text = "De madera!"
			color = Color(0.7,0,0,0.5)
		-3:
			$ComboLabel.text = "Más duro que\nla realidad"
			color = Color(0,0,0,0.7)

func success():
	combo += 1
	if combo < 0:
		combo = 0
	match combo:
		0:
			$ComboLabel.text = ""
			$ComboLabel.success()
			color = Color(0,0,0,0) # Transparent
		1:
			$ComboLabel.text = "Bien piola!"
			color = Color(0,0.5,1, 0.3)
		2:
			$ComboSprite.show()
		3:
			$ComboLabel.text = "Excelente!"
			color = Color(0.5,1,0,0.5)
		4:
			$ComboLabel.text = "Quién te conoce,\nHernán Piquin?"
			color = Color(1,1,0,0.7)
