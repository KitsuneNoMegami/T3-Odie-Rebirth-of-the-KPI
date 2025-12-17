## Node/Script : Contrôle du joueur en mode exploration
## Gère le déplacement, les animations et les interactions avec les PNJ
##
## Signaux :
## - dialogue_requested : Émis lorsqu'une interaction avec un PNJ est demandée
## - no_player_in_range : Émis lorsque le joueur sort de la zone d'interaction avec un PNJ
##
## Variables exportées :
## - gameState:Script - Script de gestion de l'état global du jeu

class_name Player
extends CharacterBody2D

## Vitesse de déplacement en pixels/seconde
var _speed: int= 250

## Indique si un PNJ est à portée d'interaction
var pnj_in_range = false # si un pnj est aux alentours

## Script de gestion de l'état global du jeu
@export var gameState: Script



## Signal émis lorsque le joueur quitte la zone d'interaction
signal no_player_in_range
@onready var sprite = $player_sprite

func _ready() -> void:
	pass

## Mise à jour à chaque frame (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	if !GameState.get_pause(): # Tant que le jeu n'est pas en pause on peut bouger le perso
		move()
		sprite_modification()

## Déplace le joueur selon les touches directionnelles appuyées
func move() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
	
## Change l'animation du sprite selon la direction du déplacement
func sprite_modification():
	if Input.is_action_pressed("down"):
		if Input.is_action_pressed("left"):
			sprite.play("down_left")
		elif Input.is_action_pressed("right"):
			sprite.play("down_right")
		else:
			sprite.play("down")
	elif Input.is_action_pressed("up"):
		if Input.is_action_pressed("left"):
			sprite.play("up_left")
		elif Input.is_action_pressed("right"):
			sprite.play("up_right")
		else:
			sprite.play("up")
	elif Input.is_action_pressed("left"):
		sprite.play("left")
	elif Input.is_action_pressed("right"):
		sprite.play("right")
	else:
		sprite.play("idle")

## Détecte l'entrée d'un PNJ dans la zone d'interaction (callback Godot)
## body:Node2D - Corps entrant dans la zone
func _on_talknode_body_entered(body: Node2D) -> void:
	if body.name == "pnj":
		pnj_in_range = true

## Détecte la sortie d'un PNJ de la zone d'interaction (callback Godot)
## body:Node2D - Corps sortant de la zone
func _on_talknode_body_exited(body: Node2D) -> void:
	if body.name == "pnj":
		pnj_in_range = false
		emit_signal("no_player_in_range")

## Gère les entrées non traitées pour démarrer les dialogues (callback Godot)
## event:InputEvent - Événement d'entrée reçu
func _unhandled_input(_event: InputEvent) -> void:
	if pnj_in_range and (Input.is_action_just_pressed("accept")):
		GameState.set_pause(true)
		if (GameState.get_pause()):
			DialogueManager.show_dialogue_balloon("start")

## Retourne la caméra du joueur
## Retourne:Camera2D - Node de la caméra du joueur
func get_map()->Camera2D:
	return $player_view

	
