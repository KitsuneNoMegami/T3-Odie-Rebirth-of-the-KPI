## Node/Script : Gestion de l'inventaire et de l'équipe
## Affiche et gère les personnages de l'équipe du joueur
##
## Signaux : Aucun

class_name Inventory
extends CanvasLayer

## État de pause de l'inventaire
var pause=false
## Conteneur de la grille d'affichage de l'équipe
@onready var grid = $team_container
## Liste des personnages dans l'inventaire
var team = []  # liste des personnages dans l'inventaire

## Initialisation de l'inventaire (callback Godot)
func _ready():
	pass
	
# Ajoute un personnage a l'inventaire
## Ajoute un personnage à l'équipe
## mate:Object - Personnage à ajouter (doit avoir name, desc, sprite)
func add_mate(mate):
	team.append(mate)
	refresh_team()

# Reprend toute l'equipe et l'affiche dans l'inventaire
## Rafraîchit l'affichage de l'équipe dans l'interface
func refresh_team():
	for child in grid.get_children(): # retire tout
		child.queue_free()  
	for mate in team:
		var slot = preload("res://scenes/inventory/teammate_slot.tscn").instantiate()
		slot.get_node("zone/teammate_sprite").texture = load(mate.sprite)
		slot.get_node("zone/description").text=mate.desc
		slot.get_node("zone/teammate_name").text = mate.name
		grid.add_child(slot)

# Affichage la page d'inventaire et mets en pause le jeu
## Affiche ou cache l'inventaire et met le jeu en pause
func show_inventory():
	pause=!pause
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false
		
# Detecte la tocuhe d'ouverture de l'inventaire
## Détecte la touche d'ouverture de l'inventaire (callback Godot)
## event:InputEvent - Événement d'entrée
func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("e")):
		show_inventory()
