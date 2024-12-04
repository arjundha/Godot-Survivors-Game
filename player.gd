extends CharacterBody2D

# Define the physics process/update
# The engine calls this each time it needs to calculate physics update
# This is done any time the Game State is updated!
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # calculates an input dimension vector as a 2d value
	velocity = direction * 600
	move_and_slide()
	if velocity:
		# get_node/$NodeName needs a PATH to the node we want to get, unless we mark is as a unique name
		# which allows us to access with %, and it gets dedicated memory, but doesnt rely on hierarchy
		# Only works within the scene, cannot be accessed elsewhere this way
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
