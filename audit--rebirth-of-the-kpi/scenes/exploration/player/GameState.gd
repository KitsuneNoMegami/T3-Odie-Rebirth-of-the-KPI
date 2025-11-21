# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

var pause= false
var fight_scene
	
func set_pause(value: bool):
	pause = value
	
func get_pause():
	return pause

func start_fight(path):
	fight_scene.fight_unfight(path)

func set_fight(fight):
	fight_scene=fight
