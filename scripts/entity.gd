extends Area2D
class_name Entity

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_screen_exited")

func _destroy():
	var destroy_animation = preload("res://scenes/destroy_animation.tscn").instance()
	destroy_animation.global_position = position 
	destroy_animation.global_scale = scale

	get_tree().current_scene.add_child(destroy_animation)

	queue_free()

func _on_screen_exited():
	queue_free()
	
