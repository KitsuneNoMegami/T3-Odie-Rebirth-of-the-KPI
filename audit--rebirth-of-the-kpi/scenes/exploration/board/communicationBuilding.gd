extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	const office_scene=preload("res://scenes/exploration/board/offices/commOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)



func _on_mouse_entered() -> void:
	var txt_box = get_parent().get_node("txt_box_com")
	txt_box.show()
	pass # Replace with function body.




func _on_mouse_exited() -> void:
	var txt_box = get_parent().get_node("txt_box_com")
	txt_box.hide()
	pass # Replace with function body.
