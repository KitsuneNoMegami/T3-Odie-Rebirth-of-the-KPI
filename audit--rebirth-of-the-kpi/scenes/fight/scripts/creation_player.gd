extends Node

func _ready():
	pass
	
func get_player():
	var player = Fighter.new(50, "Joseph",Attack.new("Mega Turbo Feur",10))
	return player
