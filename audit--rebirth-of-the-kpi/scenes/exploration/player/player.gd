class_name Player 
extends CharacterBody2D

var _speed: int= 500
var _inventory
var vanessa = {
	"name"="Vanessa",
	"desc"="Directrice des ressources humaines",
	"sprite"="res://.godot/imported/head-human resources.png-fae06a33f7bf5e87b6a37c8e1012847e.ctex"
}

var bob = {
	"name"="Bob",
	"desc"="Bob",
	"sprite"="res://assets/sprites/logistics-manager.png"
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var inventory_scene = preload("res://scenes/inventory/inventory.tscn")
	_inventory = inventory_scene.instantiate()
	_inventory.visible=false
	add_child(_inventory)
	_inventory.add_mate(vanessa)
	_inventory.add_mate(bob)

func _process(delta: float) -> void:
	move()
	

func move() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
