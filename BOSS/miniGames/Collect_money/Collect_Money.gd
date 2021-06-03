extends Node2D
onready var moneySpawner = $Money_Spawner
onready var player = $Player
onready var exitButton = $ExitButton
onready var resumeButton = $ResumeButton
onready var coinIn = $Player/coinIn
onready var coinOut = $Player/coinUut

	
func _ready():
	player.initialize()
	moneySpawner.initialize()
	exitButton.hide()
	resumeButton.hide()

func _physics_process(delta):
	if Player.money <= 0:
		Player.money = 0
		get_tree().change_scene("res://miniGames/Collect_money/Game_Over.tscn")


func _on_Area2D_body_entered(body):
	print(body.name)
	if body.is_in_group("coin"):
		var value = body.get_parent().get_value()
		if value > 0:
			coinIn.playing = true
		else:
			coinOut.playing = true
		Player.money += value
		body.get_parent().queue_free()
	pass # Replace with function body.

func pause():
	resumeButton.show()
	exitButton.show()
	get_tree().paused = true
	

func _on_ExitButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main.tscn")
	
func _on_ResumeButton_pressed():
	get_tree().paused = false
	exitButton.hide()
	resumeButton.hide()
