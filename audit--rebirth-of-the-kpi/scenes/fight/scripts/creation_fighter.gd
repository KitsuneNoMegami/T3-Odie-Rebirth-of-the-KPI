extends Node

func _ready():
	pass
	
func get_fighters():
	var attacks=[Attack.new("Analyse comportementale"),Attack.new("Gestion relationnelle")]
	var Fighters=[];
	var fighter1 = Fighter.new(10, "Mathieu",attacks)
	var fighter2 = Fighter.new(10, "Kilian",attacks)
	var fighter3 = Fighter.new(10, "Lucas",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
