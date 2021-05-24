extends Area2D

export (int) var pos_y = 100
var pos
onready var car = $Sprite

func _ready():
	position.x = -5056
	position.y = pos_y
	randomize()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	pos = rng.randi_range(5, 16)
	
func _physics_process(delta):
	if ! car.flip_h :
		if position.x < 4400:
			position.x += pos
		else:
			car.flip_h = true
			position.y -= 200
	if car.flip_h :
		if position.x >	-5056 :
			position.x -= pos
		else: 
			car.flip_h = false
			position.y += 200


func _on_RB_Car_H_body_entered(body):
	if body.is_in_group("player"):
		body.get_parent().atropellado()
		
