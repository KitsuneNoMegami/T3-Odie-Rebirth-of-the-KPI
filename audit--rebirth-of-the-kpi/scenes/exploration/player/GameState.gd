## Node/Script : Singleton de gestion de l'état global du jeu
## Stocke les données persistantes et l'état de progression des combats
##
## Signaux : Aucun
##
## Variables principales :
## - pause : État de pause du jeu
## - fight_scene : Référence à la scène de combat
## - _pole : Pôle actuellement en combat
## - _player : Instance du joueur de combat
## - marketing_win, rh_win, etc. : État de victoire de chaque pôle

# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

## État de pause du jeu
var pause = false
## Référence à la scène de combat
var fight_scene
## Pôle actuellement en combat
var _pole

## Tuto vu ?
var tuto_watched=false;

func get_tuto_state():
	return tuto_watched

func watch_tuto():
	tuto_watched = true
	pass

## Instance du joueur de combat (chargée dynamiquement)
@onready var _player = load("res://scenes/fight/scripts/creation_player.gd").new().get_player()

## Indique si le pôle Marketing a été vaincu
var marketing_win = null;
## Indique si le pôle RH a été vaincu
var rh_win = null;
## Indique si le pôle Informatique a été vaincu
var informatique_win = null;
## Indique si le pôle Communication a été vaincu
var communcation_win = null;
## Indique si le pôle Finance a été vaincu
var finance_win = null;

## Définit l'état de pause du jeu
## value:bool - Nouvel état de pause

func set_pause(value: bool):
	pause = value

func get_player():
	return _player

## Démarre un combat avec un pôle spécifique
## path:String - Chemin vers le script des ennemis
## pole:String - Nom du pôle à combattre
func start_fight(path, pole):
	_pole=pole
	if get_win(pole)==null:
		fight_scene.fight_unfight(path,pole,_player)

## Définit la référence à la scène de combat
## fight:CanvasLayer - Référence à la scène de combat
func set_fight(fight):
	fight_scene = fight

## Retourne l'état de pause actuel
func get_pause():
	return pause

## Retourne le pôle actuellement en combat
func get_pole():
	return _pole

## Vérifie si un pôle a été vaincu
## pole:String - Nom du pôle à vérifier
## Retourne:bool - true si le pôle a été vaincu
func get_win(pole):
	match pole:
		"informatique":
			return informatique_win
		"rh":
			return rh_win
		"marketing":
			return marketing_win
		"communication":
			return communcation_win
		"finance":
			return finance_win

## Marque un pôle comme vaincu
## pole:String - Nom du pôle à marquer comme vaincu
func change_state_pole(pole,state):
	match pole:
		"informatique":
			informatique_win=state
			return
		"rh":
			rh_win=state
			return
		"marketing":
			marketing_win=state
			return
		"communication":
			communcation_win=state
			return
		"finance":
			finance_win=state
			return
