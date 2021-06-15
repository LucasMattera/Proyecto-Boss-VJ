extends ColorRect
var value = 1.0


func _physics_process(delta):
	#print(material.get("shader_param/progress")) 
	material.set("shader_param/progress", value) 
	value -= delta / 2
	if value <= 0:
		queue_free() 
