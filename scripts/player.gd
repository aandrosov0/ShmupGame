extends Ship
class_name Player

var drag = false 

func _ready(): 
	connect("area_entered", self, "_on_area_entered")

func _physics_process(_delta):
	_check_borders(get_viewport_rect().size.x)

func _input(event):
	if event is InputEventMouseButton:
		drag = true if event.pressed else false

	if event is InputEventMouseMotion and drag:
		position.x += event.relative.x

func _check_borders(border_size):
	var player_size = $CollisionShape2D.shape.extents.x * scale.x
	position.x = clamp(position.x, player_size, border_size - player_size)

func _on_area_entered(_area):
	.hit(1)

func _on_shoot_timeout():
	._shoot("res://scenes/bullet_level1.tscn", true, $BulletSpawnPosition2D.global_position)

func hit(damage):
	if invicible:
		.hit(damage)
		
		$AnimationPlayer.play("hit")
		invicible = true  
		
		yield($AnimationPlayer, "animation_finished")
		invicible = false 
