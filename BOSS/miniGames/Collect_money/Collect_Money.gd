extends Node2D
onready var moneySpawner = $Money_Spawner
onready var player = $Player
onready var gui = $GUI
onready var coinIn = $Player/coinIn
onready var coinOut = $Player/coinUut

func _ready():
	player.initialize()
	moneySpawner.initialize()
	gui.initialize(player)

func _physics_process(delta):
	if Player.money <= 0:
		Player.money = 0
		get_tree().change_scene("res://miniGames/Collect_money/Game_Over.tscn")

func _on_Area2D_body_entered(body):
	print(body.name)
	if body.is_in_group("coin"):
		var value = body.get_parent().get_value()
		gui.last_Earning = 100
		coinIn.playing = true
		Player.money += 100
		body.get_parent().queue_free()

func _on_flat_body_entered(body):
	if body.is_in_group("coin"):
		Player.money -= 50
		gui.last_Earning = -50
		coinOut.playing = true
		body.get_parent().queue_free()


func _on_PausePopup_exit():
	$AudioStreamPlayer.stop()
