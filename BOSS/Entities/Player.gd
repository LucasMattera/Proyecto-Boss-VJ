extends KinematicBody2D

export (int) var speed = 400
var velocity:Vector2 = Vector2.ZERO
var can_move = true
export (int) var zoomInLimit = 9
export (int) var zoomOutLimit = 1
export (int) var money = 500
export (String) var player_name = "player 1"
var shops = []

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
