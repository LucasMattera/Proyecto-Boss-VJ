extends Area2D

#export (PackedScene) var scn_minigame
var root
func _ready():
	root = get_tree().root
	pass

func _on_DanceMinigame_body_entered(body):
	if body.name == "Player":
		# Remove the current level
		var level = root.get_node("Main")
		root.remove_child(level)
		level.call_deferred("free")

		# Add the next level
		var next_level_resource = load("res://scenes/minigames/dance/DanceMinigame.tscn")
		var next_level = next_level_resource.instance()
		root.add_child(next_level)
		#get_tree().change_scene_to(scn_minigame)
