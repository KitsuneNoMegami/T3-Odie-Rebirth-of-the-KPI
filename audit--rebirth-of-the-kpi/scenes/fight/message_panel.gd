extends Panel

func show_message(message):
	show()
	$Label.text=message
	#$Label.show()
	
func close_message():
	hide()
func get_visible():
	return visible
