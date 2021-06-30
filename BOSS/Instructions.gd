extends Node2D

onready var volverMain = $TextureRect/VolverMain
onready var volver_main_color = $TextureRect/VolverMainColor
onready var salir = $TextureRect/Salir
onready var salir_color = $TextureRect/SalirColor
onready var volverInGame = $TextureRect/VolverInGame
onready var volver_in_game_color = $TextureRect/VolverInGameColor


# Called when the node enters the scene tree for the first time.
func _ready():
	if (GameServer.is_paused):
		pause()
	else:
		instruction() 

func pause():
	volverMain.hide()
	volver_main_color.hide()
	volverInGame.show()
	volver_in_game_color.show()
	salir.show()
	salir_color.show()

func instruction():
	volverMain.show()
	volver_main_color.show()
	volverInGame.hide()
	volver_in_game_color.hide()
	salir.hide()
	salir_color.hide()
	

func _on_MenuButton_pressed():
	get_tree().change_scene("res://Main_Tittle.tscn")


func _on_VolverInGame_pressed():
	get_tree().change_scene("res://Main.tscn")
	GameServer.is_paused = false
	
