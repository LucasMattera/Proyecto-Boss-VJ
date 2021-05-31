extends Label

func fail():
	add_color_override("font_color", Color(1,1,1))

func success():
	add_color_override("font_color", Color(0,0,0))
