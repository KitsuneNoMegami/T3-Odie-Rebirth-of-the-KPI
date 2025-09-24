extends TileMapLayer

func _ready() -> void:	
	$pnj.connect("dialogue_requested", Callable(self,"on_dialogue_requested"))

func on_dialogue_requested():
	if ($dialogueBox.get_panel_visible()==true):
		$dialogueBox.next_line()
	else:
		$dialogueBox.start_dialogue()
