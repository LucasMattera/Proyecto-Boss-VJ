extends Area2D

export (int) var pos_y = 100

func _ready():
	position.x = -5056
	position.y = pos_y

func _physics_process(delta):
	if position.x < 4400:
		position.x += 8
	else:
		position.x = -5056


func _on_RB_Car_H_body_entered(body):
	if body.is_in_group("player"):
		body.position.x = 3500
		body.position.y = -1100
		if body.money >= 500:
			body.money -= 500
			Player.money -= 500
		else:
			body.money = 0
			Player.money = 0
