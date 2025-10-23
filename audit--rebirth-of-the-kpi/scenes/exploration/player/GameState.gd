# Ce fichier sert a stocker des donnees du jeu h24
# Permet aussi de les transmettre au dialogue
extends Node

var pause= false
	
func set_pause(value: bool):
	pause = value
	
func get_pause():
	return pause
