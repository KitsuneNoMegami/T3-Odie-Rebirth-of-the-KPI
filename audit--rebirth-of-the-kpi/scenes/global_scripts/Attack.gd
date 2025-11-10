class_name Attack
extends Node

var _name
var _damage
var _description

func _init(name = null, damage = null):
	_name = name
	_damage = damage
	_description = "test"

func get_damage():
	return _damage
	
func get_aname():
	return _name
		

	
