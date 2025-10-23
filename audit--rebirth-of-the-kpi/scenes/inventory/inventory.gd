class_name Inventory
extends CanvasLayer

var pause=false
@onready var grid = $team_container
var team = []  # liste des personnages dans l’inventaire

func _ready():
	pass
	
# Ajoute un personnage a l'inventaire
func add_mate(mate):
	team.append(mate)
	refresh_team()

# Reprend toute l'equipe et l'affiche dans l'inventaire
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
func show_inventory():
	pause=!pause
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false
		
# Detecte la tocuhe d'ouverture de l'inventaire
func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("e")):
		show_inventory()
