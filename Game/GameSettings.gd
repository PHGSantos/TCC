extends Resource

class_name GameSettings

export var last_save_number = 0

func _ready():
	pass 

func updateSaveNumber():
	last_save_number+=1
