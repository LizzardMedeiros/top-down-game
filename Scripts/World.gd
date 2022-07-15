extends Node2D

func count_enemies():
	var enemies = 0
	for child in get_children():
		if "Enemy" in child.name:
			enemies += 1
	return enemies

func _ready():
	pass # Replace with function body.

func _process(delta):
	if count_enemies() == 0:
		get_tree().reload_current_scene()
