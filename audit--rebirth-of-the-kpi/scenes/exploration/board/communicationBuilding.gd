## Node/Script : Bouton du bâtiment Communication
## Permet d'accéder au bureau du pôle Communication

class_name  Communication_building extends TextureButton


## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass

## Gère le clic sur le bouton pour entrer dans le bureau Communication (callback Godot)
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
