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

@onready var son: HScrollBar = $son

## Initialisation du menu de pause (callback Godot)
func _ready() -> void:
	pause=false
	_setup_volume_bar()

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



func _on_continue_pressed() -> void:
	hide()
	get_tree().paused=false
	pause=!pause
