class_name Inventory
extends CanvasLayer

var pause=false
@onready var grid = $Team_container
var team = []  # liste des objets dans l’inventaire

func _ready():
	pass
	
	
func add_mate(mate):
	team.append(mate)
	refresh_team()

func refresh_team():
	for child in grid.get_children(): # retire tout
		child.queue_free()  
	for mate in team:
		var slot = preload("res://scenes/inventory/teammate_slot.tscn").instantiate()
		slot.get_node("Panel/Teammate_sprite").texture = load(mate.sprite)
		slot.get_node("Panel/Description").text=mate.desc
		slot.get_node("Panel/Teammate_name").text = mate.name
		grid.add_child(slot)
		
func show_inventory():
	pause=!pause
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false

		
func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("e")):
		show_inventory()
