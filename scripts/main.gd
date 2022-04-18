extends Node2D

func _ready(): 
	load_entities()

func load_entities():
	var player = load("res://scenes/player_level1.tscn").instance()
	player.position = $SpawnPlayerPosition.position 
	add_child(player)