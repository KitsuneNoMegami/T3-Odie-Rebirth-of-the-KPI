class_name Board
extends TileMapLayer

func _ready() -> void:	
	$pnj.connect("dialogue_requested", Callable(self,"on_dialogue_requested"))

func on_dialogue_requested() -> void:
	if ($dialogue_box.get_panel_visible()==true):
		$dialogue_box.next_line()
	else:
		$dialogue_box.start_dialogue()
