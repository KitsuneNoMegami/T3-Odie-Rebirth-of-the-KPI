## Node/Script : Classe Fighter représentant un combattant dans le système de combat
## Ce script gère les statistiques, attaques et défenses d'un personnage (joueur ou ennemi)
##
## Signaux : Aucun
##
## Variables principales :
## - _name : Nom du combattant
## - _pv : Points de vie actuels
## - _pv_max : Points de vie maximum
## - _levelCredibility : Niveau de crédibilité (augmenté lors des victoires)
## - _levelSkill : Niveau de compétence (augmenté lors des victoires)
## - _attacks : Liste des attaques disponibles
## - _defenses : Liste des défenses disponibles
## - _pts_defense : Points de défense temporaires accumulés

class_name Fighter extends Node2D

## Nom du combattant
var _name
## Points de vie actuels
var _pv
## Points de vie maximum
var _pv_max
## Description du personnage
var _description
## Niveau de crédibilité du combattant
var _levelCredibility=0
## Niveau de compétence du combattant
var _levelSkill=0
## Liste des attaques disponibles
var _attacks
## Liste des défenses disponibles
var _defenses
## Points de défense temporaires (absorbent les dégâts)
var _pts_defense =0

## Initialisation du node (callback Godot)
func _ready():
	pass

## Constructeur du Fighter
## pv:int - Points de vie initiaux (et maximum)
## fname:String - Nom du combattant
## attacks:Array - Liste des attaques disponibles
## defenses:Array - Liste des défenses disponibles
func _init(pv=null,fname=null,attacks=null,defenses=null):
	_pv=pv
	_pv_max=pv
	_description="Ceci est la description du personnage du pole"
	_name=fname
	_attacks=attacks
	_defenses=defenses
	
## Réduit les points de vie du combattant
## pv:int - Nombre de points de vie à retirer
func delete_pv(pv):
	_pv-=pv

## Augmente le niveau de crédibilité (récompense après victoire)
## nb:int - Nombre de points à ajouter
func add_credibility(nb):
	_levelCredibility+=nb
	pass

## Augmente le niveau de compétence (récompense après victoire)
## nb:int - Nombre de points à ajouter
func add_skill(nb):
	_levelSkill+=nb
	pass

## Ajoute des points de défense temporaires
## nb:int - Nombre de points de défense à ajouter
func add_pts_defense(nb):
	_pts_defense+=nb

## Enlève les points de défense (après absorption de dégâts ou fin de tour)
## nb:int - Nombre de dégâts à absorber (null = réinitialise tous les points)
## Retourne:int - Dégâts excédentaires non absorbés (négatif si défense suffisante)
func del_defense(nb=null):
	if nb==null:
		_pts_defense=0
	else:
		_pts_defense-=nb
	return 0-_pts_defense

## Retourne le nom du combattant
func get_fname()->String:
	return _name

## Retourne la liste des défenses disponibles
func get_defenses():
	return _defenses

## Retourne la liste des attaques disponibles
func get_attacks():
	return _attacks

## Retourne la description du personnage
func get_description():
	return _description

## Retourne les points de vie actuels
func get_pv():
	return _pv

## Change l'animation du sprite
## sprite:String - Nom de l'animation à jouer
func set_sprite(sprite):
	$sprite.play(sprite)
