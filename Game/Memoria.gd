extends Control


func _ready():
	var config = get_tree().get_root().find_node("j1_config",true, false)
	config.connect("j1_config", self, "handleConfig")
	
func handleConfig():
	print('ok')
