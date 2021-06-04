extends KinematicBody2D

onready var animatedBody = $AnimatedBody
onready var animationPlayer = $AnimationPlayer

func _ready():
	animatedBody.play("idle")

func _input(event):
	if Input.is_action_just_pressed("move_left"):
		animatedBody.play("left")
		animationPlayer.play("left")
	elif Input.is_action_just_pressed("move_right"):
		animatedBody.play("right")
		animationPlayer.play("right")

func _on_AnimatedBody_animation_finished():
	animatedBody.play("idle")
	animatedBody.offset.x = 0


