extends Node

export (PackedScene) var scn_game
var arrow_in_the_ring
var life_remaining
var score
export var score_winner = 5000
var gui
var arrow_account = 11

signal player_stats_changed
signal game_over
signal win_game

func _ready():
	score = 0
	life_remaining = 3
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
	print("obtain_points")
	score += 1000
	emit_signal("player_stats_changed", self)
	if score >= score_winner:
		win_game()

func lose_life():
	print("lose_life. life_remaining:")
	life_remaining -= 1
	emit_signal("player_stats_changed", self)
	print(life_remaining)
	if life_remaining < 1:
		game_over()

func game_over():
	emit_signal("game_over")

func win_game():
	emit_signal("win_game")

func _on_GUI_arrow_in_ring(arrow):
	print("on_Ring_body_entered")
	print(arrow.name)
	arrow_in_the_ring = arrow

func _on_GUI_arrow_out_of_ring(arrow):
	print("on_Ring_body_exited")
	arrow_in_the_ring = null

func _on_GUI_arrow_out_of_screen():
	lose_life()

func _on_GUI_loser_exit():
	get_tree().paused = false
	get_tree().change_scene_to(scn_game)

func _on_GUI_loser_retry():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_GUI_winner_exit():
	get_tree().paused = false
	get_tree().change_scene_to(scn_game)
