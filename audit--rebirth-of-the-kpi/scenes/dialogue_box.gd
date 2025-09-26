extends CanvasLayer

var dialogues = [
	"Hello Toi",
	"Tu sais ce que c'est un audit ?",
	"Moi non plus"
]

var index=0
@onready var panel = $dialogueBg
@onready var label = $dialogueBg/text

func _ready() -> void:
	panel.visible=false


func start_dialogue():
	index = 0
	panel.visible = true
	show_line()

func show_line():
	if index < dialogues.size():
		label.text = dialogues[index]
	else:
		end_dialogue()

func next_line():
	index += 1
	show_line()

func end_dialogue():
	panel.visible = false
	
func _input(event: InputEvent) -> void:
	if panel.visible and event is InputEventMouseButton and event.pressed:
		next_line()

func get_panel_visible():
	return panel.visible
