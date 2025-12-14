extends Node

const FighterScene = preload("res://scenes/fight/scripts/ennemies/Fighter.tscn")

func _ready():
	pass

func create_fighter(pv: int, fname: String, attacks: Array):
	var fighter = FighterScene.instantiate()
	fighter._pv = pv
	fighter._pv_max = pv
	fighter._name = fname
	fighter._attacks = attacks
	fighter._description = "Ceci est la description du personnage du pole"
	return fighter
	
func get_fighters(pole):
	var attacks=[Attack.new("Analyse comportementale"),Attack.new("Gestion relationnelle")]
	var Fighters=[]
	var fighter1
	var fighter2
	var fighter3
	match pole:
		"rh":
			#fighter1=Fighter.new(10, "Mathieu",attacks)
			#fighter1.set_sprite("default")
			#fighter2 = Fighter.new(10, "Kilian",attacks)
			#fighter3 = Fighter.new(10, "Lucas",attacks)
			fighter1=create_fighter(10,"Wemmert",attacks)
			fighter2=create_fighter(10,"Kreamer",attacks)
			fighter3=create_fighter(10,"Roy",attacks)
		"it":
			fighter1=create_fighter(10, "Watheo",attacks)
			fighter2=create_fighter(10, "Wemmert",attacks)
			fighter3=create_fighter(10, "Ali",attacks)
	#fighter1=Fighter.new(10, "Watheo",attacks)
	#fighter2 = Fighter.new(10, "Wemmert",attacks)
	#fighter3 = Fighter.new(10, "Ali",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
