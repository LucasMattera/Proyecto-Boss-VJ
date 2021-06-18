extends Node

export (PackedScene) var money_scene

func _physics_process(delta):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()

func initialize():
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	for i in 60 :
		randomize()
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var pos = rng.randi_range(0, 1024)
		print("creo la moneda nro:")
		print(i)
		var money_instance = load("res://miniGames/Collect_money/Money.tscn").instance()
		money_instance.initialize(pos)
		self.get_parent().add_child(money_instance)
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
	
