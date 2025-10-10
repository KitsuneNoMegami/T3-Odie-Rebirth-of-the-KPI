class_name Player 
extends CharacterBody2D

var _speed: int= 500
var _inventory: Inventory= Inventory.new()
var vanessa = {
	"name"="Vanessa",
	"desc"="La pouf",
	"sprite"="res://.godot/imported/head-human resources.png-fae06a33f7bf5e87b6a37c8e1012847e.ctex"
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#_inventory.add_mate(vanessa)
	pass

func _process(delta: float) -> void:
	move()
	

func move() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * _speed
	move_and_slide()
