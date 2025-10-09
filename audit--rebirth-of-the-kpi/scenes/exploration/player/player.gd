class_name Player 
extends CharacterBody2D

var _speed: int= 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	move()

func move() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
