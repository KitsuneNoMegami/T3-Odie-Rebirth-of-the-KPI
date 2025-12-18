extends RichTextLabel

func _process(_delta: float) -> void:
	clear()
	var poles=["communication","it","commercial","finance","rh"]
	append_text("TODO List [b]:[/b]\n\n\n")
	for p in poles:
		if GameState.get_win(p)!=null:
			append_text("[s][b]--[/b] "+p+"[/s]\n")
		else:
			append_text("[b]--[/b] "+p+"\n")
	await get_tree().create_timer(2).timeout 
