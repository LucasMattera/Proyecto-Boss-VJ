extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var retry = $tittleMargin/menu/buttonRetry/button
onready var retry_label = $tittleMargin/menu/buttonRetry/button/Label
onready var lose_s : AudioStreamPlayer = get_node("lose")

# Called when the node enters the scene tree for the first time.
func _ready():
	lose_s.play()
	if Player.money < 1000:
		retry.set_disabled(true)
		retry_label.add_color_override("font_color", Color(0,0,0,0))
		#get_tree().paused=true 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_retry_button_pressed():
	if Player.money >= 1000:
		get_tree().change_scene("res://miniGames/arcanoid/world.tscn")
	


func _on_quit_button_pressed():
	print("exit")
	#get_tree().paused=false
	get_tree().change_scene("res://Main.tscn")
