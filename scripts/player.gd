extends Ship
class_name Player

func _ready(): 
	connect("area_entered", self, "_on_area_entered")

func _physics_process(delta):

	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		_movement(delta)

func _movement(delta):
	var max_size = get_viewport_rect().size.x 
	var click_position = max_size / 2 - get_viewport().get_mouse_position().x
	var direction_x = 1 if click_position <= 1 else -1
	
	position.x += direction_x * _speed * delta
	_check_borders(max_size)

func _check_borders(border_size):
	var player_size = $CollisionShape2D.shape.extents.x * scale.x
	position.x = clamp(position.x, player_size, border_size - player_size)

func _on_area_entered(_area):
	.hit(1)

func _on_shoot_timeout():
	._shoot("res://scenes/bullet_level1.tscn", true, $BulletSpawnPosition2D.global_position)
