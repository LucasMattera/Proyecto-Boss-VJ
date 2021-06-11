extends Node

export (PackedScene) var scn_game
var arrow_in_the_ring
onready var life_remaining = 3
onready var score = 0
export var score_winner = 10000
onready var arrow_asserted_points = 1000
var gui
var arrow_account = 11

signal game_over
signal win_game
signal player_stats_changed
signal success
signal fail

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

func successful_arrow():
	obtain_points()
	earn_money()

func obtain_points():
	score += arrow_asserted_points
	emit_signal("success")
	emit_signal("player_stats_changed", self)
	if score >= score_winner:
		win_game()

func earn_money():
	var amount = 0
	amount += arrow_asserted_points
	Player.obtain_money(amount)


func lose_life():
	life_remaining -= 1
	emit_signal("fail")
	emit_signal("player_stats_changed", self)
	if life_remaining < 1:
		game_over()

func game_over():
	$GUI.set_process(false)
	emit_signal("game_over")

func win_game():
	$GUI.set_process(false)
	emit_signal("win_game")

func _on_GUI_arrow_in_ring(arrow):
	arrow_in_the_ring = arrow

func _on_GUI_arrow_out_of_ring(arrow):
	arrow_in_the_ring = null

func _on_GUI_arrow_out_of_screen():
	lose_life()

func _on_GUI_loser_retry():
	reset()

func _on_GUI_player_exit():
	exit()

func exit():
	Player.can_move = true
	get_tree().change_scene("res://Main.tscn")

func reset():
	get_tree().reload_current_scene()

func _on_SFX_finished():
	var sfxName = $Audio/SFX.stream.resource_path.get_file().get_basename()
	var musicName = $Audio/Music.stream.resource_path.get_file().get_basename()
	if sfxName == "cheers" || musicName == "game_over":
		$GUI.set_process(true)
	
func _on_GUI_last_arrow_out():
	game_over()
