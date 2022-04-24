extends Entity
class_name Ship

export(int) var _health 
export(float) var _speed

export(bool) var invicible = true 

func _ready():
	$ShootTimer.connect("timeout", self, "_on_shoot_timeout")

func _shoot(bullet_path, reverse, bullet_position):
	var bullet = load(bullet_path).instance()
	bullet.position = bullet_position

	if reverse: 
		bullet.reverse()
	
	get_tree().current_scene.add_child(bullet)

func hit(damage): 
	_health -= damage 

	if _health <= 0:
		queue_free()