class_name Dialogue
extends CanvasLayer

var _texts = [
	"Hello Toi",
	"Tu sais ce que c'est un audit ?",
	"Moi non plus"
]
var index=0
@onready var _panel = $dialogue_bg
@onready var _label = $dialogue_bg/text

func _ready() -> void:
	pass
	#_panel.visible=false

func start_dialogue():
	index = 0
	_panel.visible = true
	show_line()
	
func show_line():
	print("hello46")
	if index < _texts.size():
		_label.text = _texts[index]
	else:
		end_dialogue()
		
func next_line():
	print("hgfjkdlkjhgfjdkjfg")
	index += 1
	show_line()
	
func end_dialogue():
	_panel.visible = false
	
func get_panel_visible():
	print(_panel.visible)
	return _panel.visible

func set_panel_visible(state)->void:
	_panel.visible=state
