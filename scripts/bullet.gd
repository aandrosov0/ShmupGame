extends Entity
class_name Bullet 

export(int) var damage
export(float) var speed 

func _ready():
	connect("area_entered", self, "_on_area_entered")

func _physics_process(delta):
	position.y += speed * delta 

func _on_area_entered(area):
	if not area.invicible:
		_destroy()
		
	area.hit(damage)