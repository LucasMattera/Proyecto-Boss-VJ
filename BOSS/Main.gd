extends Node

onready var player = $Player
onready var shops = $Shops
onready var GUI = $GUI
onready var atropellado = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	atropellado.hide()
	for shop in shops.get_children():
		shop.initialize(player)
	print("entre al main")
	player.initialize()
	print(player.position)
	#shop.initialize(player)
	GUI.initialize()
	#GameServer.save_game()
	#var loaded_player = GameServer.load_game()

func atropellado():
	player.hide()
	player.can_move = false
	atropellado.show()
	player.position.x = 3500
	player.position.y = -1250
	if player.money >= 500:
		player.money -= 500
		Player.money -= 500
	else:
		player.money = 0
		Player.money = 0
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	player.show()
	player.get_parent().atropellado.hide()
	player.can_move = true

