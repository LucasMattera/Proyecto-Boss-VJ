extends Node2D

onready var player : KinematicBody2D = $Player
onready var ball : RigidBody2D = $Ball

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_Gral

func initialize(player_Gral):
	player_Gral = player_Gral

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func gameOver():
	ball.queue_free()
	player.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
