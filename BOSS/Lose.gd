extends Node2D


onready var new_game = $NewGame
onready var labels = $Labels


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.set_wait_time(1.5)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "_show_labels")
	add_child(timer)
	timer.start()


func _show_labels():
	new_game.show()
	for label in labels.get_children():
		label.show()
	


func _on_NewGame_pressed():
	get_tree().change_scene("res://Main_Tittle.tscn")
