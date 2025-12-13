## Node/Script : Création des ennemis de combat
## Factory pour générer les groupes d'ennemis selon le pôle affronté
##
## Signaux : Aucun

extends Node

## Initialisation (callback Godot)
func _ready():
	pass

## Crée et retourne un groupe d'ennemis pour un pôle donné
## pole:String - Nom du pôle ("rh", "it", etc.)
## Retourne:Array - Liste de 3 combattants ennemis
func get_fighters(pole):
	var attacks=[Attack.new("Analyse comportementale"),Attack.new("Gestion relationnelle")]
	var Fighters=[]
	var fighter1
	var fighter2
	var fighter3
	match pole:
		"rh":
			fighter1=Fighter.new(10, "Mathieu",attacks)
			#fighter1.set_sprite("default")
			fighter2 = Fighter.new(10, "Kilian",attacks)
			fighter3 = Fighter.new(10, "Lucas",attacks)
		"it":
			fighter1=Fighter.new(10, "Watheo",attacks)
			fighter2 = Fighter.new(10, "Wemmert",attacks)
			fighter3 = Fighter.new(10, "Ali",attacks)
	fighter1=Fighter.new(10, "Watheo",attacks)
	fighter2 = Fighter.new(10, "Wemmert",attacks)
	fighter3 = Fighter.new(10, "Ali",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
