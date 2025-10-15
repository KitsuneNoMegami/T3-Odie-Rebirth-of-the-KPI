extends Node

@onready var start: Label = $start
@onready var settings: Label = $settings
@onready var exit: Label = $exit

var text: Array[Label]
var nb := 4

func _ready() -> void:
	text = [start, settings, exit]

	# Connexion du survol de la souris
	for i in range(text.size()):
		text[i].connect("mouse_entered", Callable(self, "_on_label_hovered").bind(i))
		text[i].connect("mouse_exited",Callable(self,"_on_label_hovered").bind(4))
	update_selection()

func _input(event: InputEvent) -> void:
	# Flèche bas
	if event.is_action_pressed("down"):
		nb = (nb + 1) % text.size()
		update_selection()

	# Flèche haut
	elif event.is_action_pressed("up"):
		nb = (nb - 1 + text.size()) % text.size()
		update_selection()

	# Entrée ou clic gauche (car accept contient les deux)
	elif event.is_action_pressed("accept"):
		trigger_action(nb)

func _on_label_hovered(i: int) -> void:
	nb = i
	update_selection()

#reagis à la l'input accept 
func trigger_action(i: int) -> void:
	match i:
		0:
			get_tree().change_scene_to_file("res://scenes/exploration/board/board.tscn")
		1:
			print("Settings !")
		2:
			print("Exit !")
			get_tree().quit()

#met a jour la taille de chaque label quand nécéssaire
func update_selection() -> void:
	for i in range(text.size()):
		if i == nb:
			text[i].add_theme_font_size_override("font_size", 125)
			text[i].modulate = Color(1, 1, 0) # Jaune = sélectionné
		else:
			text[i].add_theme_font_size_override("font_size", 60)
			text[i].modulate = Color(1, 1, 1) # Blanc = normal
