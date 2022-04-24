extends Entity
class_name Ship

export(int) var _health
export(float) var _speed

export(bool) var invicible = true
export(Resource) var current_bullet 

func _ready():
	connect("area_entered", self, "_on_area_entered")
	$ShootTimer.connect("timeout", self, "_on_shoot_timeout")

func _shoot(bullet_position):
	var bullet = current_bullet.instance()
	bullet.position = bullet_position
		
	get_tree().current_scene.add_child(bullet)

func _on_area_entered(area):
	if not area is Bullet:
		hit(1)

func _on_shoot_timeout():
	_shoot($BulletSpawnPosition2D.global_position)

func hit(damage): 
	if not invicible:
		_health -= damage 

		if _health <= 0:
			._destroy()

		$AnimationPlayer.play("hit")
