extends KinematicBody2D

onready var animatedBody = $AnimatedBody

func _ready():
	animatedBody.play("idle")

func _input(event):
	if Input.is_action_just_pressed("move_left"):
		animatedBody.play("left")
		animatedBody.offset.x = -100
	elif Input.is_action_just_pressed("move_right"):
		animatedBody.play("right")
		animatedBody.offset.x = 100

func _on_AnimatedBody_animation_finished():
	animatedBody.play("idle")
	animatedBody.offset.x = 0


