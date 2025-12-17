## Node/Script : Création des ennemis de combat
## Factory pour générer les groupes d'ennemis selon le pôle affronté
##
## Signaux : Aucun

extends Node

const FighterScene = preload("res://scenes/fight/scripts/ennemies/Fighter.tscn")

## Initialisation (callback Godot)
func _ready():
	pass

## Crée et retourne un groupe d'ennemis pour un pôle donné
## pole:String - Nom du pôle ("rh", "it", etc.)
## Retourne:Array - Liste de 3 combattants ennemis
func create_fighter(pv: int, fname: String, attacks: Array, defenses: Array = []):
	var fighter = FighterScene.instantiate()
	fighter._pv = pv
	fighter._pv_max = pv
	fighter._name = fname
	fighter._attacks = attacks
	fighter._defenses = defenses
	return fighter

func generate_buff(pole_skill,pole_credibility,player_skill,player_credibility):
	return 1+((pole_skill-player_skill)+(pole_credibility-player_credibility))/100

func get_fighters(pole,lvl_skill,lvl_credibility):
	var attacks=[Attack.new("Analyse comportementale",),Attack.new("Gestion relationnelle")]
	var Fighters=[]
	var fighter1
	var fighter2
	var fighter3
	var buff
	match pole:
		"rh":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			#fighter1=Fighter.new(10, "Mathieu",attacks)
			#fighter1.set_sprite("default")
			#fighter2 = Fighter.new(10, "Kilian",attacks)
			#fighter3 = Fighter.new(10, "Lucas",attacks)
			fighter1=create_fighter(10*buff,"Wemmert",attacks)
			fighter2=create_fighter(10*buff,"Kreamer",attacks)
			fighter3=create_fighter(10*buff,"Roy",attacks)
		"it":
			fighter1=create_fighter(10*buff, "Watheo",attacks)
			fighter2=create_fighter(10*buff, "Wemmert",attacks)
			fighter3=create_fighter(10*buff, "Ali",attacks)
		"communication":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Wemmert",attacks)
			fighter2=create_fighter(10*buff,"Kreamer",attacks)
			fighter3=create_fighter(10*buff,"Roy",attacks)
		"finance":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Wemmert",attacks)
			fighter2=create_fighter(10*buff,"Kreamer",attacks)
			fighter3=create_fighter(10*buff,"Roy",attacks)
		"commercial":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Wemmert",attacks)
			fighter2=create_fighter(10*buff,"Kreamer",attacks)
			fighter3=create_fighter(10*buff,"Roy",attacks)
	#fighter1=Fighter.new(10, "Watheo",attacks)
	#fighter2 = Fighter.new(10, "Wemmert",attacks)
	#fighter3 = Fighter.new(10, "Ali",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
