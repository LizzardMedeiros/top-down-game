extends KinematicBody2D

var motion = Vector2()

func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
	var player = get_parent().get_node("Player")
	var distance_2_hero = get_global_position().distance_to(player.get_global_position())
	if distance_2_hero < 130:
		position += (player.position - position) / 50
		look_at(player.position)
		move_and_collide(motion)
	
func kill():
	queue_free()
	

func _on_HitBox_body_entered(body):
	if "Bullet" in body.name:
		body.queue_free()
		kill()
