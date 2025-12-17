extends NinePatchRect

@onready var label: RichTextLabel= get_node("RichTextLabel")

func _ready() -> void:
	pass
	
func addLog(text:String)->void:
	label.add_text(text)
	
func clearLog()->void:
	label.clear()
