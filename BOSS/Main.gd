extends Node

onready var player = $Player
onready var shops = $Shops
onready var GUI = $GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	for shop in shops.get_children():
		shop.initialize(player)
	print("entre al main")
	player.initialize()
	#shop.initialize(player)
	GUI.initialize()
	#GameServer.save_game()
	#var loaded_player = GameServer.load_game()



