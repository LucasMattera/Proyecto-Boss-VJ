extends Area2D

export (int) var pos_x = 100
var pos
onready var car = $Sprite

func _ready():
	position.x = -1920
	position.x = pos_x
	randomize()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	pos = rng.randi_range(5, 16)
	
func _physics_process(delta):
	if ! car.flip_v :
		if position.y < 3600:
			position.y += pos
		else:
			car.flip_v = true
			position.x += 200
	if car.flip_v :
		if position.y >	-1920 :
			position.y -= pos
		else: 
			car.flip_v = false
			position.x -= 200


func _on_A2D_Car_v_body_entered(body):
	if body.is_in_group("player"):
		body.get_parent().atropellado()
		
