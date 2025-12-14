extends Node

const FighterScene = preload("res://scenes/fight/scripts/ennemies/Fighter.tscn")

func _ready():
	pass
	
func get_player():
	var attacks=[Attack.new("Collecte d'information"),Attack.new("Turbo puissance")]
	var defenses=[Attack.new("Reformulation protectrice")]
	var player = FighterScene.instantiate()
	player._pv = 50
	player._pv_max = 50
	player._name = "Odie"
	player._attacks = attacks
	player._defenses = defenses
	player._description = "Ceci est la description du personnage du pole"
	return player
