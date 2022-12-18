extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2(0,0)

func _physics_process(delta):
	var _collision_info = move_and_collide(velocity.normalized() * delta * speed)
