extends Node

onready var player = $Player
onready var shops = $Shops
onready var GUI = $GUI
onready var atropellado = $GUI/Label
onready var hospital_shader = $GUI/ShaderHospital
onready var car_spawner_h = $Car_Spawner_H
onready var car_spawner_v = $Car_Spawner_V
onready var save = $GUI/Save
onready var music = $BGM

# Called when the node enters the scene tree for the first time.
func _ready():
	var shops_size = 0
	atropellado.hide()
	for shop in shops.get_children():
		shop.initialize(player)
		shops_size = shops_size + 1
	print("entre al main")
	player.initialize()
	GameServer.shops_size = shops_size
	print(player.position)
	#shop.initialize(player)
	GUI.initialize(player)
	car_spawner_h.initialize()
	car_spawner_v.initialize()
	
	#GameServer.save_game()
	#var loaded_player = GameServer.load_game()

func atropellado():
	player.hide()
	player.can_move = false
	hospital_shader.show()
	atropellado.show()
	player.position.x = 3500
	player.position.y = -1250
	player.money -= 100
	Player.money -= 100
	Player.last_earning = -100
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	player.show()
	player.get_parent().atropellado.hide()
	hospital_shader.hide()
	player.can_move = true


func show_save():
	save.show()
	var timer = Timer.new()
	timer.set_wait_time(4)
	timer.set_one_shot(false)
	timer.connect("timeout", self , "hide_save")
	add_child(timer)
	timer.start()

func hide_save():
	save.hide()	

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		GameServer.save_game()
		show_save()
		print("Game Saved")

func _on_MusicTimer_timeout():
	music.play()
