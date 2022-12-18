extends KinematicBody2D

export (int) var speed = 50

var velocity = Vector2(0,0)

const bulletPath = preload("res://Bullet/SimpleBullet.tscn")

func get_input():
	rotation = get_global_mouse_position().angle_to_point(position)
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		shoot()

func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	bullet.position = $Position2D.global_position
	bullet.velocity = get_global_mouse_position() - bullet.position
