# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

var pause= false
	
func set_pause(value: bool):
	pause = value
	
func get_pause():
	return pause

func start_fight():
	const fight_scene=preload("res://scenes/fight/fight.tscn")
	get_tree().change_scene_to_packed(fight_scene)
