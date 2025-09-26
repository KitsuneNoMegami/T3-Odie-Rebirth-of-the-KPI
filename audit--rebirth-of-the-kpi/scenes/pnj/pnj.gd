extends Area2D

signal dialogue_requested #Signal pour le dialogue 

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("dialogue_requested")
	

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		emit_signal("dialogue_requested")
