extends Node2D

onready var music = $BGM
# Timer que da tiempo a pausar musica entre escenas. Evita clips de audio.
onready var changeToNewGameTimer = $ChangeToNewGameTimer
onready var changeToLoadGameTimer = $ChangeToLoadGameTimer
onready var nowLoading = $TextureRect/NowLoadingScreen
export var newPlayerScene: PackedScene
export var loadGameScene: PackedScene
export var instructions: PackedScene

func _ready():
	print(GameServer.load_game())
	print(Player.money)

func _on_New_Game_pressed():
	music.stop()
	nowLoading.show()
	changeToNewGameTimer.start()

func _on_Load_Game_pressed():
	music.stop()
	nowLoading.show()
	changeToLoadGameTimer.start()

func _on_Instructions_pressed():
	music.stop()
	GameServer.is_paused = false
	get_tree().change_scene("res://Instructions.tscn")

func _on_MusicTimer_timeout():
	music.play()

func _on_ChangeToNewGameTimer_timeout():
	get_tree().change_scene("res://InitGame.tscn")

func _on_ChangeToLoadGameTimer_timeout():
	var dataLoad = GameServer.load_game()
	Player.money = dataLoad.money
	Player.player_name = dataLoad.player_name
	Player.shops = dataLoad.shops
	Player.position.x = dataLoad.pos_x
	Player.position.y = dataLoad.pos_y
	get_tree().change_scene("res://Main.tscn")
