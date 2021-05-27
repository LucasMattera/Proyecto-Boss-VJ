extends Area2D


export (int) var pos_y
export (int) var pos_x
export (int) var do_flip = false
var pos
onready var car 
var Selected_car
onready var carY = $yellow
onready var carG = $green
onready var carR = $red
onready var list_sprite_car = [carY, carG, carR]

func _ready():
	carG.hide()
	carY.hide()
	carR.hide()
	position.x = pos_x
	position.y = pos_y
	randomize()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	pos = rng.randi_range(5, 16)
	randomize()
	var carSprite = RandomNumberGenerator.new()
	carSprite.randomize()
	Selected_car = carSprite.randi_range(0, 2)
	car = list_sprite_car[Selected_car]

func initialize(positiony, positionX, flip):
	position.y = positiony
	position.x = positionX
	do_flip = flip
	
func _physics_process(delta):
	if Selected_car == 0 && ! carY.visible:
		carY.show()
	if Selected_car == 1 && ! carG.visible:
		carG.show()
	if Selected_car == 2 && ! carR.visible :
		carR.show()
	if do_flip :
		car.flip_v = true
		do_flip = false
	if ! car.flip_v :
		if position.y < 3600:
			position.y += pos
		else:
			queue_free()
	if car.flip_v :
		if position.y >	-1920 :
			position.y -= pos
		else: 
			queue_free()


func _on_A2D_Car_v_body_entered(body):
	if body.is_in_group("player"):
		body.get_parent().atropellado()
		
