extends CanvasLayer

func stop():
	for arrow in get_children():
		arrow.speed = 0
