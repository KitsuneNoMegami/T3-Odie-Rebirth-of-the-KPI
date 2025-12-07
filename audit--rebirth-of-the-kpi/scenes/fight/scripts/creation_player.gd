extends Node

func _ready():
	pass
	
func get_player():
	var attacks=[Attack.new("Collecte d'information")]
	var defenses=[Attack.new("Reformulation protectrice")]
	var player = Fighter.new(50, "Joseph",attacks,defenses)
	return player
