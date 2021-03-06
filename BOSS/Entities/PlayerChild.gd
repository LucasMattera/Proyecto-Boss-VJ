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
var playingsfx = false
signal open_shop_status
var actual
func _ready():
	Player.connect("coin_picked", self, "obtainCoin")

func obtainCoin(value):
	money += value
	actualizeMoney(value)

#func _on_Player_coin_picked(amount):
#	money += amount

func initialize():
	actual = Player.actual
	shops = Player.shops
	money = Player.money
	player_name = Player.player_name
	position.x = Player.position.x
	position.y = Player.position.y
	animation.animation = "idle"
	
func get_input():
	velocity = Vector2()
	if animation.animation != "idle" && !playingsfx:
		playingsfx = true
		walkAudio.playing= true
	if Input.is_action_pressed('move_right'):
		animation.animation = "right"
		velocity.x += 0.5
	if Input.is_action_pressed('move_left'):
		animation.animation = "left"
		velocity.x -= 0.5
	if Input.is_action_pressed('move_down'):
		animation.animation = "down"
		velocity.y += 0.5
	if Input.is_action_pressed('move_up'):
		animation.animation = "up"
		velocity.y -= 0.5
	if Input.is_action_just_released("move_down") || Input.is_action_just_released("move_right") || Input.is_action_just_released("move_left") || Input.is_action_just_released("move_up"): 
		animation.animation = "idle"
		playingsfx = false
	if animation.animation == "idle":
		walkAudio.playing= false
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed('run'):
		velocity = velocity * 2
	if (Input.is_action_just_pressed("pause")):
		Player.global_position = global_position
		GameServer.is_paused = true
		get_tree().change_scene("res://Instructions.tscn")
	if (Input.is_action_just_pressed("shop-status")):
		emit_signal("open_shop_status")
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
		"shops": shops,
		"actual": actual
	}
	return save_dict
