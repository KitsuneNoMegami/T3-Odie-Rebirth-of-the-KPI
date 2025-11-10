extends Node

@onready var ActionsScript = preload("res://scenes/global_scripts/Actions.gd")
@onready var FighterScript = preload("res://scenes/ennemies/scripts/Fighter.gd")
@onready var AttackScript = preload("res://scenes/global_scripts/Attack.gd")

func _ready():
	var actions = ActionsScript.new()
	var fighter1 = FighterScript.new(10, "feur")
	var fighter2 = FighterScript.new(10, "feur")
	var attack = AttackScript.new("feur", 5)
	
	_test(actions, fighter1, attack)
	
func _test(actions, fighter, attack):
	actions.attack(fighter, attack)
