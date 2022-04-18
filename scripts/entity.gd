extends Area2D
class_name Entity

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_screen_exited")

func _on_screen_exited():
    queue_free()
    