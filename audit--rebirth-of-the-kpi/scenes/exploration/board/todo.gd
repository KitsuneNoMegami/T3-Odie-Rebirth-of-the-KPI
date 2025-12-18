extends RichTextLabel

func _process(_delta: float) -> void:
	clear()
	var poles=["communication","it","commercial","finance","rh"]
	var txt
	for p in poles:
		if GameState.get_win(p)!=null:
			txt="[s] - "+p+"[/s]\n"
			add_text(txt)
			return
		add_text("- "+p+"\n")
	await get_tree().create_timer(2).timeout 
