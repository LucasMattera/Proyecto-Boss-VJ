extends Camera2D

export (int) var limit_zoom_out = 9
export (int) var limit_zoom_in = 1

func _unhandled_input(event):
	if event.is_action("zoom-out") && limit_zoom_out >= self.zoom.x :
		self.zoom.x += 0.2 
		self.zoom.y += 0.2
	if event.is_action("zoom-in") && limit_zoom_in <=  self.zoom.x :
		self.zoom.x -= 0.2
		self.zoom.y -= 0.2
