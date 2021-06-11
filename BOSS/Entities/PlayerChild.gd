extends KinematicBody2D

onready var animation = $Sprite
onready var walkAudio = $walk
export (int) var speed = 400
export (int) var workMoney = 5
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (String) var player_name = "player 1"
var shops = []

func initialize():
	shops = Player.shops
	money = Player.money
	Player.player_name = player_name 
	position.x = Player.position.x
	position.y = Player.position.y
	animation.animation = "idle"
	
func get_input():
	velocity = Vector2()
	if Input.is_action_just_pressed('move_right'):
		walkAudio.playing= true
	if Input.is_action_just_pressed("move_left") :
		walkAudio.playing= true
	if Input.is_action_just_pressed("move_down") :
		walkAudio.playing= true
	if Input.is_action_just_pressed("move_up") :
		walkAudio.playing= true
	if Input.is_action_pressed('move_right'):
		animation.animation = "right"
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		animation.animation = "left"
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		animation.animation = "down"
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		animation.animation = "up"
		velocity.y -= 1
	if Input.is_action_just_released("move_down") || Input.is_action_just_released("move_right") || Input.is_action_just_released("move_left") || Input.is_action_just_released("move_up"): 
		animation.animation = "idle"
	if animation.animation == "idle":
		walkAudio.playing= false
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed('run'):
		velocity = velocity * 2
	if (Input.is_action_just_pressed("pause")):
		GameServer.is_paused = true
		get_tree().change_scene("res://Instructions.tscn")
	if (Input.is_action_just_pressed("work_hard")):
		print("se trabaja")
		self.money += workMoney
		Player.last_earning = workMoney
		actualizeMoney(self.money)
		print("ganaste 20 pesos")
	Player.velocity = velocity
	Player.money = money
		
func is_player():
	return true

func _physics_process(delta):
	if(can_move):
		get_input()
		velocity = move_and_slide(velocity)

func recollect_money():
	print('Ganancia por locales :')
	print(self.shops.size())
	var collected_money = Player.money
	for shop in self.shops:
		self.money += shop.earnings
	Player.last_earning = self.money - collected_money
	Player.money = self.money
	actualizeMoney(self.money)
	print('dinero actual: ' )
	print(self.money)
	
func actualizeMoney(value):
	#self.money = value	
	GameServer.save_game()
	print("guardado")

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"money": money,
		"player_name": player_name,
		"shops": shops
	}
	return save_dict
