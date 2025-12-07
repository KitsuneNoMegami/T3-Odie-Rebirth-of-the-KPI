extends Node

func _ready():
	pass
	
func get_player():
	var attacks=[Attack.new("Mega Turbo Feur",10),Attack.new("Turbo cuite",20)]
	var defenses=[Attack.new("Motivation",5),Attack.new("Préparation",2)]
	var player = Fighter.new(50, "Joseph",attacks,defenses)
	return player
