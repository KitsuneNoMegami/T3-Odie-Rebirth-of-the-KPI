extends CanvasLayer
var pause=false

@onready var start: Label = $start
@onready var settings: Label = $settings
@onready var exit: Label = $exit

func _ready() -> void:
	text = [start, settings, exit]

	for i in range(text.size()):
		text[i].set_process_mode(Node.PROCESS_MODE_ALWAYS)  # Labels actifs pendant la pause
		text[i].mouse_filter = Control.MOUSE_FILTER_STOP    # pour bien capter le survol
		text[i].connect("mouse_entered", Callable(self, "_on_label_hovered").bind(i))

	_update_selection()
	_update_selection()

var text: Array[Label]
var nb := 0

func pauseunpause():
	pause=!pause
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pauseunpause()
	
	# Flèche bas
	if event.is_action_pressed("down"):
		nb = (nb + 1) % text.size()
		_update_selection()

	# Flèche haut
	elif event.is_action_pressed("up"):
		nb = (nb - 1 + text.size()) % text.size()
		_update_selection()

	# Entrée ou clic gauche (car accept contient les deux)
	elif event.is_action_pressed("accept"):
		_trigger_action(nb)

func _on_label_hovered(i: int) -> void:
	nb = i
	_update_selection()

#reagis à la l'input accept 
func _trigger_action(i: int) -> void:
	match i:
		0:
			hide()
			get_tree().paused=false
			pause=!pause
		1:
			print("Settings !")
		2:
			print("Exit !")
			get_tree().quit()

#met a jour la taille de chaque label quand nécéssaire
func _update_selection() -> void:
	for i in range(text.size()):
		if i == nb:
			text[i].add_theme_font_size_override("font_size", 125)
			text[i].modulate = Color(1, 1, 0) # Jaune = sélectionné
		else:
			text[i].add_theme_font_size_override("font_size", 60)
			text[i].modulate = Color(1, 1, 1) # Blanc = normal
