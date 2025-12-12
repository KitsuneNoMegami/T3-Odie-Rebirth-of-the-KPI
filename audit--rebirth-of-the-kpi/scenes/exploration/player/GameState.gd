# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

var pause= false
var fight_scene
var _pole
@onready var _player =load("res://scenes/fight/scripts/creation_player.gd").new().get_player()
var marketing_win=false;
var rh_win=false;
var informatique_win=false;
var communcation_win=false;
var finance_win=false;
	
func set_pause(value: bool):
	pause = value


func start_fight(path,pole):
	_pole=pole
	fight_scene.fight_unfight(path,pole,_player)

func set_fight(fight):
	fight_scene=fight
	
func get_pause():
	return pause
	
func get_pole():
	return _pole

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

func change_state_pole(pole):
	match pole:
		"informatique":
			informatique_win=true
			return
		"rh":
			rh_win=true
			return
		"marketing":
			marketing_win=true
			return
		"communication":
			communcation_win=true
			return
		"finance":
			finance_win=true
			return
