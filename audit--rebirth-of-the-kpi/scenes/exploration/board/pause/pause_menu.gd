extends CanvasLayer
var pause=false
var text: Array[Label]
var nb := 4

@onready var start: Label = $start
@onready var son: HScrollBar = $son
@onready var exit: Label = $exit

func _ready() -> void:
	text = [start, exit]
	_setup_volume_bar()

	for i in range(text.size()):
		text[i].mouse_filter = Control.MOUSE_FILTER_STOP    # pour bien capter le survol avec la souris
		text[i].connect("mouse_entered", Callable(self, "_on_label_hovered").bind(i))
		text[i].connect("mouse_exited",Callable(self,"_on_label_hovered").bind(4))
	_update_selection()

func _setup_volume_bar() -> void:
	var current_db := AudioServer.get_bus_volume_db(0)

	son.value = db_to_linear(current_db)
	son.mouse_filter = Control.MOUSE_FILTER_STOP
	son.connect("value_changed", Callable(self, "_on_volume_changed"))

func _on_volume_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func pause_unpause():
	pause=!pause
	print('aabbbbbaaa')
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false

func _input(event: InputEvent) -> void:
	if not visible :
		return
	if event.is_action_pressed("pause"):
		await get_tree().create_timer(0.1).timeout
		hide()
		get_tree().paused=false
		pause=!pause
	# Flèche bas
	if event.is_action_pressed("down"):
		nb = (nb + 1) % text.size()
		_update_selection()

	# Flèche haut
	elif event.is_action_pressed("up"):
		nb = (nb - 1 + text.size()) % text.size()
		_update_selection()

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
