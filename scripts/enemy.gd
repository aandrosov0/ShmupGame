extends Ship
class_name Enemy

func _physics_process(delta):
	position.y += _speed * delta 

func _on_shoot_timeout():
	._shoot("res://scenes/bullet_level1.tscn", false, $BulletSpawnPosition2D.global_position)