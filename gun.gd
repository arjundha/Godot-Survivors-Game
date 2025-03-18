extends Area2D

const BULLET = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if (enemies_in_range.size()):
#		https://www.reddit.com/r/godot/comments/1fw1k69/comment/lqcg6a7/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
		enemies_in_range.sort_custom(func(a, b):
			return a.global_position.distance_squared_to(global_position) < b.global_position.distance_squared_to(global_position)
		)
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
func shoot() -> void:
	var bullet = BULLET.instantiate()
	bullet.global_position = %ShootingPoint.global_position
	bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bullet)
	
func change_speed(multiplier: float) -> void:
	$Timer.wait_time *= multiplier

func _on_timer_timeout() -> void:
	shoot()
