class_name PNJ
extends  StaticBody2D

@onready var sprite = $pnj_sprite

func _ready():
	sprite.play("idle")

func _process(delta: float) -> void:
	pass
