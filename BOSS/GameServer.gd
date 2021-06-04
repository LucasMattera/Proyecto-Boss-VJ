extends Node

var recaudacion = 0 
var is_paused = false
var shops_size = 0

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		var node_data = node.call("save")
		save_game.store_line(to_json(node_data))
	save_game.close()
		
func load_game() -> JSONParseResult:
	var result
	var save_game = File.new()
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	print(get_tree().get_nodes_in_group("Persist"))
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		result = node_data
	save_game.close()
	return result

func minigame_generateMoney(value):
	self.recaudacion = value
func _ready():
	pass 
