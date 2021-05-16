extends Node

export (PackedScene) var scn_game
var arrow_in_the_ring
onready var life_remaining = 3
onready var score = 0
export var score_winner = 5000
var gui
var arrow_account = 11

signal game_over
signal win_game
signal player_stats_changed

func _ready():
	score = 0
	life_remaining = 3
	print("entre")
	$GUI.set_minigame(self)

func _input(event):
	if Input.is_action_just_pressed("move_left"):
		
		if arrow_in_the_ring != null:
			arrow_in_the_ring.verify_if_is_correct("left")
			# Verificar si la flecha izquierda
			# Esta en el aro
		else:
			lose_life()
	if Input.is_action_just_pressed("move_right"):
		if arrow_in_the_ring != null:
			arrow_in_the_ring.verify_if_is_correct("right")
			# Idem flecha derecha
		else:
			lose_life()

func obtain_points():
	score += 1000
	emit_signal("player_stats_changed", self)
	if score >= 1000:
		Player.money += 1000
		win_game()

func lose_life():
	life_remaining -= 1
	emit_signal("player_stats_changed", self)
	if life_remaining < 1:
		game_over()

func game_over():
	emit_signal("game_over")

func win_game():
	emit_signal("win_game")

func _on_GUI_arrow_in_ring(arrow):
	print(arrow.name)
	arrow_in_the_ring = arrow

func _on_GUI_arrow_out_of_ring(arrow):
	arrow_in_the_ring = null

func _on_GUI_arrow_out_of_screen():
	lose_life()

func _on_GUI_loser_exit():
	#get_tree().change_scene_to(scn_game)
	exit()

func _on_GUI_loser_retry():
	reset()

func _on_GUI_winner_exit():
	exit()
	#get_tree().change_scene_to(scn_game)

func exit():
	Player.can_move = true
	get_tree().change_scene("res://Main.tscn")
	

func reset():
	#get_tree().root.get_node("DanceMinigame").get_tree().reload_current_scene()
	get_tree().reload_current_scene()
