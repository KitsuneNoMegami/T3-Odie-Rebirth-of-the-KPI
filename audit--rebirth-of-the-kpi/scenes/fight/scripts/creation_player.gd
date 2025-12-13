## Node/Script : Création du personnage joueur pour le combat
## Factory pour créer une instance du joueur avec ses compétences de base
##
## Signaux : Aucun

extends Node

## Initialisation (callback Godot)
func _ready():
	pass

## Crée et retourne une instance du joueur avec ses compétences
## Retourne:Fighter - Instance du joueur de combat
func get_player():
	var attacks=[Attack.new("Collecte d'information"),Attack.new("Turbo puissance")]
	var defenses=[Attack.new("Reformulation protectrice")]
	var player = Fighter.new(50, "Joseph",attacks,defenses)
	return player
