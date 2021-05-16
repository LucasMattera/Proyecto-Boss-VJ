extends Node


onready var player = $Player
onready var shop = $Shop
onready var GUI = $GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	print("entre al main")
	player.initialize()
	shop.initialize(Player)
	GUI.initialize()
	#GameServer.save_game()
	#var loaded_player = GameServer.load_game()
	player.money = Player.money
	player.player_name = Player.player_name
	player.position.x = Player.position.x 
	player.position.y = Player.position.y 
	player.shops = Player.shops

# Note: This can be called from anywhere inside the tree. This function
# is path independent.

