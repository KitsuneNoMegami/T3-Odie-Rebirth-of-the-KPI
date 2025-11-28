extends  StaticBody2D

@onready var sprite = $pnj_sprite

func _ready():
	sprite.play("wemmert")

func _process(delta: float) -> void:
	pass
