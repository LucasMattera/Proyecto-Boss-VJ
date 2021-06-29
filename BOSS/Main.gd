extends Node

onready var player = $Player
onready var shops = $Shops
onready var GUI = $GUI
onready var wasted = $GUI/ShaderHospital/ZIndex/Wasted
onready var hospital_shader = $GUI/ShaderHospital
onready var car_spawner_h = $Car_Spawner_H
onready var car_spawner_v = $Car_Spawner_V
onready var save = $GUI/Save
onready var music = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var shops_size = 0
	wasted.hide()
	for shop in shops.get_children():
		shop.initialize(player)
		shops_size = shops_size + 1
	print("entre al main")
	player.initialize()
	GameServer.shops_size = shops_size
	print(player.position)
	GUI.initialize(player)
	car_spawner_h.initialize()
	car_spawner_v.initialize()

func atropellado():
	player.hide()
	player.can_move = false
	hospital_shader.show()
	wasted.show()
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
	player.get_parent().wasted.hide()
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
	_on_HouseArea2D_body_entered(body)
	music.stop()

func _on_HouseArea2D_body_entered(body):
	if body.is_in_group("player"):
		GameServer.save_game()
		show_save()
		print("Game Saved")

func _on_InitTimer_timeout():
	music.play()

func _on_FinishTimer_timeout():
	pass # Replace with function body.
