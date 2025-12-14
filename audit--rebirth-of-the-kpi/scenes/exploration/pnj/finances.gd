## Node/Script : PNJ Banquier
## Représente le personnage du banquier (Roy) dans le jeu
##
## Signaux : Aucun

class_name Finances_pnj
extends StaticBody2D

@onready var sprite = $pnj_sprite

## Initialisation du PNJ Banquier (callback Godot)
func _ready():
	sprite.play("roy")

## Mise à jour du PNJ (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass