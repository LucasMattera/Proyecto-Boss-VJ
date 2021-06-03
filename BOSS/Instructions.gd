extends Node2D


onready var volverMain = $VolverMain
onready var salir = $Salir
onready var volverInGame = $VolverInGame


# Called when the node enters the scene tree for the first time.
func _ready():
	if (GameServer.is_paused):
		pause()
	else:
		instruction() 

func pause():
	volverMain.hide()
	volverInGame.show()
	salir.show()

func instruction():
	volverMain.show()
	volverInGame.hide()
	salir.hide()
	

func _on_MenuButton_pressed():
	get_tree().change_scene("res://Main_Tittle.tscn")


func _on_VolverInGame_pressed():
	get_tree().change_scene("res://Main.tscn")
