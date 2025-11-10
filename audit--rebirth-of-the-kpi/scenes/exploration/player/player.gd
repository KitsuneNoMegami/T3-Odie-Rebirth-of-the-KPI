class_name Player 
extends CharacterBody2D

var _speed: int= 250
var _inventory
var pnj_in_range = false # si un pnj est aux alentours
var dialogue_ressource = load("res://Rh.dialogue")
@export var gameState: Script

signal dialogue_requested #Signal pour le dialogue 
signal no_player_in_range

@onready var sprite = $player_sprite

#Pour l'instant les personnages de l'equipe x	
var vanessa = {
	"name"="Vanessa",
	"desc"="Directrice des ressources humaines",
	"sprite"="res://.godot/imported/head-human resources.png-fae06a33f7bf5e87b6a37c8e1012847e.ctex"
}

var bob = {
	"name"="Bob",
	"desc"="Bob",
	"sprite"="res://assets/sprites/logistics-manager.png"
}

# Charge l'inventaire manuellement et ajouter les personnages a l'equipe
func _ready() -> void:
	var inventory_scene = preload("res://scenes/inventory/inventory.tscn")
	_inventory = inventory_scene.instantiate()
	_inventory.visible=false
	add_child(_inventory)
	_inventory.add_mate(vanessa)
	_inventory.add_mate(bob)

func _process(delta: float) -> void:
	if !GameState.get_pause(): # Tant que le jeu n'est pas en pause on peut bouger le perso
		move()
		sprite_modification()

# Deplace le joueur avec les fleches
func move() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
	
# Modifie le sprite du joueur en fonction du deplacement
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

# Detecte si le joueur arrive pres d'un pnj
func _on_talknode_body_entered(body: Node2D) -> void:
	if body.name == "pnj":
		pnj_in_range = true

# Detecte si le pnj sort de la zone de contact du joueur
func _on_talknode_body_exited(body: Node2D) -> void:
	if body.name == "pnj":
		pnj_in_range = false
		emit_signal("no_player_in_range")

# Gere les dialogues 
func _unhandled_input(event: InputEvent) -> void:
	if pnj_in_range and (Input.is_action_just_pressed("accept")):
		GameState.set_pause(true)
		if (GameState.get_pause()):
			DialogueManager.show_dialogue_balloon(dialogue_ressource,"start")

func get_map()->Camera2D:
	return $player_view
