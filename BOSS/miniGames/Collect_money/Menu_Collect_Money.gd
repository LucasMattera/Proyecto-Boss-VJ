extends Node2D
onready var exit = $ExitButton
onready var start = $StartButton

func _ready():
	if Player.money == 0 :
		start.disabled = true

func _on_ExitButton_pressed():
	get_tree().change_scene("res://Main.tscn") # Replace with function body.


func _on_StartButton_pressed():
	get_tree().change_scene("res://miniGames/Collect_money/Collect_Money.tscn") # Replace with function body.
