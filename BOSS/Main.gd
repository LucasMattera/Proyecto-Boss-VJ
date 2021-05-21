extends Node

onready var player = $Player
onready var shop = $Shop
onready var GUI = $GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	print("entre al main")
	player.initialize()
	shop.initialize(player)
	GUI.initialize()
	#GameServer.save_game()
	#var loaded_player = GameServer.load_game()


# Note: This can be called from anywhere inside the tree. This function
# is path independent.

