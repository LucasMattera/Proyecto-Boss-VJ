extends Node
var YposList = [ -1920, 3300 ]
var Xposlist = [-1248, 832, -3328, 2752]

export (PackedScene) var car_h_scene

func _physics_process(delta):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()

func initialize():
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	
	while ! get_parent().pause_mode: 
		randomize()
		var rngy = RandomNumberGenerator.new()
		rngy.randomize()
		var posy = rngy.randi_range(0, 1)
		var rngx = RandomNumberGenerator.new()
		rngx.randomize()
		var posx = rngx.randi_range(0, 3)
		var car_instance = load("res://Entities/Cars/A2D_Car_v.tscn").instance()
		if posy == 0:
			car_instance.initialize(YposList[posy], Xposlist[posx], false)
			car_instance.pos_y = YposList[posy]
			car_instance.pos_x = Xposlist[posx]
		if posy == 1:
			car_instance.initialize(YposList[posy], Xposlist[posx]  + 200, true)
			car_instance.pos_y = YposList[posy] 
			car_instance.pos_x = Xposlist[posx] + 200
		self.get_parent().add_child(car_instance)
		var t = Timer.new()
		t.set_wait_time(2)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
