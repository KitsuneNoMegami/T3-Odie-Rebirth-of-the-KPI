extends Node

@onready var start: Label = $start
@onready var settings: Label = $settings
@onready var exit: Label = $exit

var text: Array[Label]
var nb := 0

func _ready() -> void:
	text = [start, settings, exit]
	_update_selection()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("down"):
		nb = (nb + 1) % text.size()
		_update_selection()
	elif event.is_action_pressed("up"):
		nb = (nb - 1 + text.size()) % text.size()
		_update_selection()
	elif event.is_action_pressed("accept"):
		match nb:
			0:
				get_tree().change_scene_to_file("res://home.tscn")
			1:
				print("Settings !")
			2:
				get_tree().quit()

func _update_selection() -> void:
	for i in range(text.size()):
		if i == nb:
			text[i].add_theme_font_size_override("font_size", 125)
			text[i].modulate = Color(1, 1, 0) # Jaune pour l’élément choisi
		else:
			text[i].add_theme_font_size_override("font_size", 60)
			text[i].modulate = Color(1, 1, 1) # Blanc normal
