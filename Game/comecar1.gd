extends Button

signal j1_config

func _on_Comecar_mouse_entered():
	$Sprite.modulate.r = 0.7
	$Sprite.modulate.g = 0.7
	$Sprite.modulate.b = 0.7


func _on_Comecar_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1


