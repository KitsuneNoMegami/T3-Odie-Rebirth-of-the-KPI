class_name Board
extends TileMapLayer

var map_open : bool = false
@onready var pause : CanvasLayer = $pause
@onready var map_camera : Camera2D = $map_camera
@onready var player_camera : Camera2D= $player.get_node("player_view")

func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_map"):
		_toggle_map()
	if event.is_action_pressed("pause"):
		pause.pause_unpause()


func _toggle_map()->void:
	map_open=!map_open
	if map_open:
		map_camera.make_current()
	else:
		# Return to the player's camera
		player_camera.make_current()
