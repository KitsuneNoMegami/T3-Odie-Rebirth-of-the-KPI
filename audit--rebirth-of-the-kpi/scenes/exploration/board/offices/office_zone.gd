extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		var scene_path := "res://scenes/exploration/board/mapMario.tscn"
		# Defer the scene change so it doesn't run during the physics callback
		get_tree().call_deferred("change_scene_to_file", scene_path)
