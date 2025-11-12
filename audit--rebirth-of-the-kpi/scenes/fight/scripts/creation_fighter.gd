extends Node

#@onready var FighterScript = preload("res://scenes/ennemies/scripts/Fighter.gd")
func _ready():
	pass
	
func get_fighters():
	var attack=Attack.new("Turbo Feur",2)
	var Fighters=[];
	var fighter1 = Fighter.new(20, "Jonathan",attack)
	var fighter2 = Fighter.new(20, "Kilian",attack)
	var fighter3 = Fighter.new(20, "Lucas",attack)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
