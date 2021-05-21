extends Camera2D

export (int) var limit_zoom_out = 9
export (int) var limit_zoom_in = 1

func get_input():
	if Input.is_action_pressed("zoom-out") && limit_zoom_out >= self.zoom.x :
		self.zoom.x += 0.2 
		self.zoom.y += 0.2
	if Input.is_action_pressed("zoom-in") && limit_zoom_in <=  self.zoom.x :
		self.zoom.x -= 0.2
		self.zoom.y -= 0.2

func _physics_process(delta):
	get_input()
