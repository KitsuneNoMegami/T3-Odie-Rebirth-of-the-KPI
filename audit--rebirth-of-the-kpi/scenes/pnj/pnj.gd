extends  StaticBody2D

signal dialogue_requested #Signal pour le dialogue 
var player_in_range = false

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("ui_accept"):
		emit_signal("dialogue_requested")

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if (player_in_range and (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT)):
		emit_signal("dialogue_requested")

func _on_talknode_body_entered(body: Node2D) -> void:
	print("Hello")
	if body.name == "player":
		player_in_range = true


func _on_talknode_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
