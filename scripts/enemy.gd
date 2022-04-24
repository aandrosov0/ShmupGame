extends Ship
class_name Enemy

func _ready():
	$VisibilityNotifier2D.connect("screen_entered", self, "_on_screen_entered")

func _physics_process(delta):
	position.y += _speed * delta 

func _on_screen_entered():
	$ShootTimer.start()
	invicible = false		