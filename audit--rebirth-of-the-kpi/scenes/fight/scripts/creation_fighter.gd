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
	var buff=1+(((pole_skill-player_skill)+(pole_credibility-player_credibility))/100)
	buff=clamp(buff,1,100)
	return buff

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
			fighter1=create_fighter(10*buff,"Z",attacks)
			fighter2=create_fighter(10*buff,"Jeff",attacks)
			fighter3=create_fighter(10*buff,"Kraemer",attacks)
		"it":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff, "Blindauer",attacks)
			fighter2=create_fighter(10*buff, "Wathéo",attacks)
			fighter3=create_fighter(10*buff, "Batman",attacks)
		"communication":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Wessler",attacks)
			fighter2=create_fighter(10*buff,"Core",attacks)
			fighter3=create_fighter(10*buff,"Ivanoe",attacks)
		"finance":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Mosser",attacks)
			fighter2=create_fighter(10*buff,"Feur",attacks)
			fighter3=create_fighter(10*buff,"Roy",attacks)
		"commercial":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Maman",attacks)
			fighter2=create_fighter(10*buff,"Ali",attacks)
			fighter3=create_fighter(10*buff,"Ilias",attacks)
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
