## Node/Script : Bouton du bâtiment Commercial/Marketing
## Permet d'accéder au bureau du pôle Marketing

extends TextureButton


# Called when the node enters the scene tree for the first time.
## Initialisation du bouton (callback Godot)
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
## Mise à jour du bouton (callback Godot)
## delta:float - Temps écoulé depuis la dernière frame en secondes
func _process(delta: float) -> void:
	pass


## Gère le clic sur le bouton pour entrer dans le bureau Marketing (callback Godot)
func _on_pressed() -> void:
	const office_scene=preload("res://scenes/exploration/board/offices/marketingOffice.tscn")
	get_tree().change_scene_to_packed(office_scene)
