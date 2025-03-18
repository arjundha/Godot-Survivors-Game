extends CharacterBody2D

#var player
#
# when a given node and all its children are created
#func _ready() -> void:
	#player = get_node("/root/Game/Player")

var health = 3
const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")

@onready var player = get_node("/root/Game/Player")

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	# global_position is where the current entitity is in the game world
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
