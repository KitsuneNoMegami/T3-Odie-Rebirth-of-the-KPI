extends TileMapLayer
@export var gameState: Script

var txt1 = "Bonjour, c'est moi [Nom], le directeur général de la Z corp, c'est moi qui est fait appel a vous afin de réaliser l'audit interne de l'entreprise."
var txt2 = "Pour ce faire, vous allez devoir vous rendre dans les différents pôles de l'entreprise (en cliquant dessus)."
var txt3 = "Puis vous devrez inspecter les pôles en interrogeant le chef de département correspondant. Attention cependant il pourrait vous causez un peu de tort."
var speech_part= 0
@export var tuto_txt :RichTextLabel

func _ready():
	if GameState.get_tuto_state() == false:
		get_tree().call_group("Tuto", "show")
	else:
		get_tree().call_group("Tuto", "hide")
	pass
	
func _process(delta: float) -> void:
	if(speech_part==0):
		tuto_txt.append_text(txt1.left(1))
		txt1 = txt1.erase(0,1)
	elif(speech_part==1):
		tuto_txt.append_text(txt2.left(1))
		txt2 = txt2.erase(0,1)
	elif(speech_part==2):
		tuto_txt.append_text(txt3.left(1))
		txt3 = txt3.erase(0,1)
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("accept"):
		if !txt1.is_empty()&&speech_part==0:
			tuto_txt.append_text(txt1)
			txt1 = ""
		elif !txt2.is_empty()&&speech_part==1:
			tuto_txt.append_text(txt2)
			txt2 = ""
		elif !txt3.is_empty()&&speech_part==2:
			tuto_txt.append_text(txt3)
			txt3 = ""
		else:
			tuto_txt.clear()
			tuto_txt.append_text("[color=black]")
			speech_part +=1
		GameState.watch_tuto()

		
	pass
