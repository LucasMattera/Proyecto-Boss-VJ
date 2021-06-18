extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var exit = $Exit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_arcanoid_body_entered(body):
	if(body.is_in_group("player")):
		print("entre")
		get_tree().change_scene("res://miniGames/arcanoid/tittle/Tittle.tscn")
		Player.can_move = false
		Player.global_position = exit.global_position
		GameServer.save_game()
		#get_tree().change_scene("res://miniGames/arcanoid/tittle/Tittle.tscn")
# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
