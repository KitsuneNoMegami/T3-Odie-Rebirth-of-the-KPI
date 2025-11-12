extends Node

func _init():
	pass

func attack(target,_attack):
	if(target.get_pv()<=0):
		print(target.get_fname(), " est mort")
		return false
	else:
		print(_attack.get_aname(), " est lancé sur ", target.get_fname()," et lui inflige ",_attack.get_damage(), " dégats")
		target.delete_pv(_attack.get_damage())
		if(target.get_pv()<=0):
			print(target.get_fname(), " est mort")
			return true

func use_object(target,object):
	object.use(target)
