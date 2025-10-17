class_name Board
extends TileMapLayer

@onready var dialogue_box = $dialogue_box
func _ready() -> void:	
	$player.connect("dialogue_requested", Callable(self,"on_dialogue_requested"))
	$player.connect("no_player_in_range",Callable(self,"on_no_player_in_range"))

func on_dialogue_requested() -> void:
	if (dialogue_box.get_panel_visible()==true):
		dialogue_box.next_line()
	else:
		dialogue_box.start_dialogue()
	
func on_no_player_in_range()->void:
	dialogue_box.set_panel_visible(false)
