extends Node2D

onready var music = $BGM
# Timer que da tiempo a pausar musica entre escenas. Evita clips de audio.
onready var changeToNewGameTimer = $ChangeToNewGameTimer
onready var changeToLoadGameTimer = $ChangeToLoadGameTimer
export var mainScene: PackedScene
export var instructions: PackedScene

func _ready():
	print(GameServer.load_game())
	print(Player.money)

func _on_New_Game_pressed():
	music.stop()
	changeToNewGameTimer.start()

func _on_Load_Game_pressed():
	music.stop()
	changeToLoadGameTimer.start()

func _on_Instructions_pressed():
	music.stop()
	GameServer.is_paused = false
	#get_tree().change_scene(instructions)
	change_to(instructions)

func change_to(aScene: PackedScene):
	var instancedScene = aScene.instance()
	add_child(instancedScene)

func _on_MusicTimer_timeout():
	music.play()

func _on_ChangeToNewGameTimer_timeout():
	#get_tree().change_scene("res://Main.tscn")
	change_to(mainScene)

func _on_ChangeToLoadGameTimer_timeout():
	var dataLoad = GameServer.load_game()
	Player.money = dataLoad.money
	Player.player_name = dataLoad.player_name
	Player.shops = dataLoad.shops
	Player.position.x = dataLoad.pos_x
	Player.position.y = dataLoad.pos_y
	get_tree().change_scene("res://Main.tscn")
