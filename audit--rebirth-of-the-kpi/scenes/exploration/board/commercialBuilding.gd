## Node/Script : Bouton du bâtiment Commercial/Marketing
## Permet d'accéder au bureau du pôle Marketing

class_name  Commercial_building extends TextureButton

## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass


## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass


## Gère le clic sur le bouton pour entrer dans le bureau Marketing (callback Godot)
func _on_pressed() -> void:
	const office_scene=preload("res://scenes/exploration/board/offices/marketingOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)


func _on_mouse_entered() -> void:
	var txt_box = get_parent().get_node("txt_box_scam")
	txt_box.show()
	pass # Replace with function body.




func _on_mouse_exited() -> void:
	var txt_box = get_parent().get_node("txt_box_scam")
	txt_box.hide()
	pass # Replace with function body.
