extends Area2D

export (int) var pos_y = 100
export (int) var pos_x = -5056
export (int) var do_flip = false

var pos
var Selected_car
onready var carY = $yellow
onready var carG = $green
onready var carR = $red
onready var list_sprite_car = [carY, carG, carR]
var car 

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
		car.flip_h = true
		do_flip = false
	if ! car.flip_h :
		if position.x < 4400:
			position.x += pos
		else:
			self.queue_free()
	if car.flip_h :
		if position.x >	-5056 :
			position.x -= pos
		else: 
			self.queue_free()


func _on_RB_Car_H_body_entered(body):
	if body.is_in_group("player"):
		body.get_parent().atropellado()
		