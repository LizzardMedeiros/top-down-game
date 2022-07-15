extends KinematicBody2D

const SPEED = 200
const BULLET_SPEED = 2000

const BULLET_ACTOR = preload("res://Actors/Bullet.tscn")

func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed("wasd_up"):
		motion.y -= 1
	elif Input.is_action_pressed("wasd_down"):
		motion.y += 1
	if Input.is_action_pressed("wasd_left"):
		motion.x -= 1
	elif Input.is_action_pressed("wasd_right"):
		motion.x += 1
	
	if Input.is_action_just_pressed("LMB"):
		shoot()

	motion = motion.normalized()
	motion = move_and_slide(motion * SPEED)
	
	look_at(get_global_mouse_position())
	
func shoot():
	var bullet_inst = BULLET_ACTOR.instance()
	bullet_inst.position = get_global_position()
	bullet_inst.rotation_degrees = rotation_degrees
	bullet_inst.apply_impulse(Vector2(), Vector2(BULLET_SPEED, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_inst)
	
func kill():
	get_tree().reload_current_scene()

func _on_HitBox_body_entered(body):
	if "Enemy" in body.name:
		kill()
