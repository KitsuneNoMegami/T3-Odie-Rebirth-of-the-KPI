## Node/Script : Menu de pause du jeu
## Gère l'affichage du menu de pause, les réglages de volume et les options
##
## Signaux : Aucun

class_name Pause_menu extends CanvasLayer

## État de pause
var pause=false
## Liste des labels du menu
var text: Array[Label]
## Index de l'élément sélectionné (4 = aucune sélection)
var nb := 4 

@onready var start: Label = $start
@onready var son: HScrollBar = $son
@onready var exit: Label = $exit

## Initialisation du menu de pause (callback Godot)
func _ready() -> void:
	text = [start, exit]
	pause=false
	_setup_volume_bar()

	for i in range(text.size()):
		text[i].mouse_filter = Control.MOUSE_FILTER_STOP    # pour bien capter le survol avec la souris
		text[i].connect("mouse_entered", Callable(self, "_on_label_hovered").bind(i))
		text[i].connect("mouse_exited",Callable(self,"_on_label_hovered").bind(4))
	_update_selection()

## Configure la barre de volume
func _setup_volume_bar() -> void:
	var current_db := AudioServer.get_bus_volume_db(0)

	son.value = db_to_linear(current_db)
	son.mouse_filter = Control.MOUSE_FILTER_STOP
	son.connect("value_changed", Callable(self, "_on_volume_changed"))

## Callback du changement de volume
## value:float - Nouvelle valeur linéaire du volume (0-1)
func _on_volume_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

## Bascule entre pause et reprise du jeu
func pause_unpause():
	pause=!pause
	if (pause):
		show()
		get_tree().paused=true
	else:
		hide()
		get_tree().paused=false

## Gère les entrées dans le menu de pause (callback Godot)
## event:InputEvent - Événement d'entrée
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
		await get_tree().create_timer(0.1).timeout
		_trigger_action(nb)

## Callback de survol des labels par la souris
## i:int - Index du label survolé
func _on_label_hovered(i: int) -> void:
	nb = i
	_update_selection()

#reagis à l'input accept
## Exécute l'action du menu sélectionné
## i:int - Index de l'action (0=Reprendre, 1=Quitter)
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
## Met à jour l'apparence des labels selon la sélection
func _update_selection() -> void:
	for i in range(text.size()):
		if i == nb:
			text[i].add_theme_font_size_override("font_size", 125)
			text[i].modulate = Color(1, 1, 0) # Jaune = sélectionné
		else:
			text[i].add_theme_font_size_override("font_size", 60)
			text[i].modulate = Color(1, 1, 1) # Blanc = normal
