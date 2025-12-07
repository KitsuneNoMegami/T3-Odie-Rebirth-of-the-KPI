extends Node

func _ready():
	pass
	
func get_fighters():
	var attacks=[Attack.new("Quoi",2),Attack.new("feur",5)]
	var Fighters=[];
	var fighter1 = Fighter.new(20, "Mathieu",attacks)
	var fighter2 = Fighter.new(20, "Kilian",attacks)
	var fighter3 = Fighter.new(20, "Lucas",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
