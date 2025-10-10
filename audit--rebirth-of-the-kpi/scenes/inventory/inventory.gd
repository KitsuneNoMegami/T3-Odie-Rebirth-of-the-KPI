class_name Inventory
extends CanvasLayer

var pause=false
@onready var grid = $Grid
var team = []  # liste des objets dans l’inventaire

func add_mate(mate):
	team.append(mate)
	refresh_team()

func refresh_team():
	grid.clear()  # retire tout
	for mate in team:
		var slot = preload("res://scenes/inventory/teammate_slot.tscn").instantiate()
		slot.get_node("Panel/Teammate_sprite").texture = mate.sprite
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
