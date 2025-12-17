## Node/Script : Bouton du bâtiment RH (Ressources Humaines)
## Permet d'accéder au bureau du pôle RH

class_name  Rh_building extends TextureButton


# Called when the node enters the scene tree for the first time.
## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(_delta: float) -> void:
	pass


## Gère le clic sur le bouton pour entrer dans le bureau RH (callback Godot)
func _on_pressed() -> void:
	const office_scene=preload("res://scenes/exploration/board/offices/rhOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)


func _on_mouse_entered() -> void:
	var txt_box = get_parent().get_node("txt_box_rh")
	txt_box.show()
	pass # Replace with function body.




func _on_mouse_exited() -> void:
	var txt_box = get_parent().get_node("txt_box_rh")
	txt_box.hide()
	pass # Replace with function body.


func _on_finances_mouse_entered() -> void:
	pass # Replace with function body.


func _on_finances_mouse_exited() -> void:
	pass # Replace with function body.


func _on_it_mouse_entered() -> void:
	pass # Replace with function body.
