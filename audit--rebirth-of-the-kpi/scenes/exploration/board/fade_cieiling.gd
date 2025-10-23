extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Teste si le player entre et si oui met l'alpha du layer du plafond a 0
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Player:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a=0

# Teste si le player ressort et si oui remet le plafond visible
func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
		if body is Player:
			var parent = self.get_parent()
			if parent:
				parent.modulate.a=1
