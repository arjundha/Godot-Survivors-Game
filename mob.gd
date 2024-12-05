extends CharacterBody2D

#var player
#
# when a given node and all its children are created
#func _ready() -> void:
	#player = get_node("/root/Game/Player")

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	# global_position is where the current entitity is in the game world
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
