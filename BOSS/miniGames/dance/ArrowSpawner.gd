extends CanvasLayer

signal last_arrow

func _on_RightArrow6_tree_exited():
	emit_signal("last_arrow")

func stop():
	for arrow in get_children():
		arrow.speed = 0
