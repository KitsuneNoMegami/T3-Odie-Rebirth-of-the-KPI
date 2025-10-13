class_name PNJ
extends  StaticBody2D

signal dialogue_requested #Signal pour le dialogue 
var player_in_range = false
@onready var sprite = $pnj_sprite

func _ready():
	sprite.play("idle")

func _process(delta: float) -> void:
	if player_in_range and (Input.is_action_just_pressed("accept")):
		emit_signal("dialogue_requested")

func _on_talknode_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = true

func _on_talknode_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
