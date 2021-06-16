extends Node

var YposList = [ -850, 280, 1345, 2496]
var Xposlist = [-5056, 4400]

export (PackedScene) var car_h_scene

func _physics_process(delta):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
		
func initialize():
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	
	while ! get_parent().pause_mode: 
		randomize()
		var rngy = RandomNumberGenerator.new()
		rngy.randomize()
		var posy = rngy.randi_range(0, 39)
		var rngx = RandomNumberGenerator.new()
		rngx.randomize()
		var posx = rngx.randi_range(0, 1)
		var car_instance = load("res://Entities/Cars/RB_Car_H.tscn").instance()
		if posx == 0:
			car_instance.initialize(YposList[posy / 10], Xposlist[posx], false)
			car_instance.pos_y = YposList[posy / 10]
			car_instance.pos_x = Xposlist[posx]
		if posx == 1:
			car_instance.initialize(YposList[posy / 10] - 200, Xposlist[posx], true)
			car_instance.pos_y = YposList[posy / 10] - 200
			car_instance.pos_x = Xposlist[posx]
		self.get_parent().add_child(car_instance)
		var t = Timer.new()
		t.set_wait_time(2)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")

func pauseGenerate():
	pause_mode= true
