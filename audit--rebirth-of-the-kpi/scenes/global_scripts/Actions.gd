extends Node

func _init():
	print("")
	
func attack(target,_attack):
	if(target.get_pv()<0):
		print(target.get_fname(), " est mort")
	else:
		print("Vous lancer ", _attack.get_aname(), " sur ", target.get_fname()," et lui infligez ",_attack.get_damage(), " dégats")
		target.delete_pv(_attack.get_damage())
		if(target.get_pv()<0):
			print(target.get_fname(), " est mort")
	
func use_object(target,object):
	object.use(target)
