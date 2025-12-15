# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

var pause= false
var fight_scene
var _pole
@onready var _player =load("res://scenes/fight/scripts/creation_player.gd").new().get_player()
var marketing_win=null;
var rh_win=null;
var informatique_win=null;
var communcation_win=null;
var finance_win=null;
	
func set_pause(value: bool):
	pause = value


func start_fight(path,pole):
	_pole=pole
	if get_win(pole)==null:
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
