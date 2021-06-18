extends Node2D


onready var continue_working = $ContinueWorking
onready var exit_working = $ExitWorking
onready var work_label = $WorkLabel
onready var earnings_label = $Earnings
onready var p_key = $P
onready var y_key = $Y
onready var exit = $Exit

var earnings

func _ready():
	earnings = 0

func _physics_process(delta):
	get_input()
	
func get_input():
	if(Player.is_working):
		if (Input.is_action_just_pressed("work_hard")):
			earnings += 5
			earnings_label.set_text("GANANCIAS ACTUALES : $" + String(earnings))
		if (Input.is_action_just_pressed("pause")):
			work_label.hide()
			earnings_label.hide()
			p_key.hide()
			y_key.hide()
			continue_working.show()
			exit_working.show()
		
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Player.can_move = false
		Player.global_position = exit.global_position
		Player.is_working = true
		GameServer.save_game()
		get_tree().change_scene("res://Work_Game.tscn") # Replace with function body.

func _on_ExitWorking_pressed():
	self.hide()
	Player.is_working = false
	Player.money += earnings
	Player.last_earning = earnings
	get_tree().change_scene("res://Main.tscn")
	

func _on_ContinueWorking_pressed():
	work_label.show()
	earnings_label.show()
	p_key.show()
	y_key.show()
	continue_working.hide()
	exit_working.hide()
