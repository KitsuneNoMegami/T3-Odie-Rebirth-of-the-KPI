extends Panel

func show_message(message):
	show()
	$Label.text=message
	var a=true
	while(a):
		if(Input.is_action_just_pressed("accept")):
			a=false
func close_message():
	hide()
func get_visible():
	return visible
