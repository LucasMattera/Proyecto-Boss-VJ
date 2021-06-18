extends Node

onready var sky = $Sky
onready var background = $ShopsAndStreet
onready var moon = $Moon

onready var skyDay = Color(1.0, 1.0, 1.0, 1.0)
onready var BackgroundDay = Color(1.0, 1.0, 1.0, 1.0)
onready var skyNight = Color(0.2, 0.1, 0.3, 1.0)
onready var BackgroundNight = Color(1.0, 0.8, 0.4, 1.0)


func _ready():
	if randomizer():
		day()
	else:
		night()

func randomizer():
	return randi() % 2 == 0

func day():
	sky.modulate = skyDay
	background.modulate = BackgroundDay

func night():
	sky.modulate = skyNight
	background.modulate = BackgroundNight
	moon.show()
