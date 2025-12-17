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
func create_fighter(pv: int, fname: String, attacks: Array, defenses: Array = [],description:String=""):
	var fighter = FighterScene.instantiate()
	fighter._pv = pv
	fighter._pv_max = pv
	fighter._name = fname
	fighter._attacks = attacks
	fighter._defenses = defenses
	fighter._description=description
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
			fighter1=create_fighter(10*buff,"Z",attacks,[],"L’ultime barbu qui a ses cheveux sur son menton.
Ce grand coquin n’hésiterait pas à donner un vilain coup de fouet pour motiver ses employés.")
			fighter2=create_fighter(10*buff,"Jeff",attacks,[],"Le légendaire secrétaire , le seul l'unique , le fabuleux , le légendaire , le ravissssant 
			JJJJJJJJEEEEEEEEFFFFF Smoliga!")
			fighter3=create_fighter(10*buff,"Kraemer",attacks,[],"Il est en charge des voyages à l’étranger. Pour résumer, il essaie de se débarrasser des élèves en les envoyant loin.")
		"it":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff, "Blindauer",attacks,[],"Cette personne est chargée de la maintenance et du maintien du bon fonctionnement de tous les ordinateurs de l’IUT.\n Son rôle est donc majeur pour le bon fonctionnement de l’établissement.")
			fighter2=create_fighter(10*buff, "Wathéo",attacks,[],"Cet employé est unique en son genre.\n Il a été recruté pendant ses années de BUT après avoir installé Linux sur l’ordinateur de son professeur.\n Après avoir terminé cette mission, il aurait dit : “C’était comme un lundi.")
			fighter3=create_fighter(10*buff, "Batman",attacks,[],"Il apparaît uniquement lorsqu’on l’appelle avec un Bat-signal.\n Quand nous avons besoin de lui, tel un sauveur, il jaillit et aide l’entreprise à résoudre ses problèmes.")
		"communication":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Wessler",attacks,[],"Il vous apprend à parler un bon français dans un milieu professionnel.")
			fighter2=create_fighter(10*buff,"Core",attacks,[],"Créé par des gens géniaux, il donne des informations sur les événements à venir. Venez y adhérer !")
			fighter3=create_fighter(10*buff,"Ivanoe",attacks,[],"Cet employé a été recruté à la suite de discussions philosophiques récurrentes avec différents professeurs de son établissement.\n Les professeurs se sont accordés sur le fait qu’il devrait mettre à profit cette envie de partager son savoir.")
		"finance":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Mosser",attacks,[],"Célèbre banquier de l'iut, il est connu pour son savoir-faire et sa discrétion professionnelle avec ses clients.\n Il aurait été recruté à la suite d’un blanchiment d’argent dans un casino.")
			fighter2=create_fighter(10*buff,"Le Z coin",attacks,[],"Commandante des Z coin.\nElle représente la monnaie officielle de l’IUT : cette pièce est recherchée pour délit de fuite après s’être échappée des caisses de l’établissement.")
			fighter3=create_fighter(10*buff,"Roy",attacks,[],"Elle ")
		"commercial":
			buff=generate_buff(10,10,lvl_skill,lvl_credibility)
			attacks=[Attack.new("Analyse comportementale",buff),Attack.new("Gestion relationnelle",buff)]
			fighter1=create_fighter(10*buff,"Maman",attacks)
			fighter2=create_fighter(10*buff,"Ali",attacks,[],"Il est chargé des stages .\n Trouvez un stage et tout ira bien pour vous sinon il viendra la nuit vous hantez.")
			fighter3=create_fighter(10*buff,"Ilias",attacks,[],"Rêve de Leya en esclave tout les soirs et partage cette passion avec Wathéo")
	Fighters.append(fighter1)
	Fighters.append(fighter2)
	Fighters.append(fighter3)
	return Fighters
