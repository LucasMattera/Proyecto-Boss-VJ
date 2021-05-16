extends Node

onready var player = $Player
onready var shop = $Shop
onready var GUI = $GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	player.initialize()
	shop.initialize(player)
	GUI.initialize(player)

func doActualize(value):
	GUI.actualizeMoney(value)
