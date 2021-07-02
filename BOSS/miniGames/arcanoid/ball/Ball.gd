extends RigidBody2D

onready var break_s : AudioStreamPlayer = get_node("break")
onready var start_s : AudioStreamPlayer = get_node("start")
onready var lose_s : AudioStreamPlayer = get_node("lose")
onready var win_s : AudioStreamPlayer = get_node("win")
onready var hit_s : AudioStreamPlayer = get_node("hit")

var gameStarted : bool = false
var gameFinished : bool = false

func _input(event):
	
	if event.is_action_pressed("start") && not gameStarted:
		start_s.play()
		linear_velocity = Vector2(50, -200)
		gameStarted = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_block"):
			body.queue_free()
			break_s.play()
			if body.get_parent().get_child_count() == 1 :
				print("Stage Complete")
				gameFinished = true
				win_s.play()
				Player.money += 10000
				yield(win_s, "finished")
				queue_free()
				var retry_scene = load("res://miniGames/arcanoid/tittle/Win.tscn")
				var winInstance = retry_scene.instance()
				get_parent().gameOver()
				get_parent().add_child(winInstance)
		elif body.get_name() == "bottom_wall" &&  ! gameFinished :
			print("Game Over")
			if Player.money <= 1000:
				Player.money = 0
			else: 
				Player.money -= 1000
			var retry_scene = load("res://miniGames/arcanoid/tittle/Retry.tscn")
			get_parent().gameOver()
			get_parent().add_child(retry_scene.instance())
		else:
			hit_s.play()

func _on_PauseMenu_exit():
	linear_velocity = Vector2(0, 0)
