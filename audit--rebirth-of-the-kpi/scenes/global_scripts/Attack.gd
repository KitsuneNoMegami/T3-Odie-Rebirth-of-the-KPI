class_name Attack
extends Node

var _name
var _damage
var _description

func _init(aname = null, damage = null):
	_name = aname
	_damage = damage
	_description = "test"

func get_damage():
	return _damage
	
func get_aname()->String:
	return _name
		

	
