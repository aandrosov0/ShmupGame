extends Ship
class_name Player

var _drag = false 

func _ready(): 
	$AnimationPlayer.connect("animation_started", self, "_on_animation_started")
	$AnimationPlayer.connect("animation_finished", self, "_on_animation_finished")

func _physics_process(_delta):
	_check_borders(get_viewport_rect().size.x)

func _input(event):
	if event is InputEventMouseButton:
		_drag = true if event.pressed else false

	if event is InputEventMouseMotion and _drag:
		position.x += event.relative.x

func _check_borders(border_size):
	var player_size = $CollisionShape2D.shape.extents.x * scale.x
	position.x = clamp(position.x, player_size, border_size - player_size)

func _on_animation_started(_name): 
	invicible = true 

func _on_animation_finished(_name): 
	invicible = false
