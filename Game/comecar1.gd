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


func _on_Comecar_pressed():
	$Sprite.modulate.r = 0.5
	$Sprite.modulate.g = 0.5
	$Sprite.modulate.b = 0.5
	var n = $".".find_node("/root/VBoxContainer/HBoxContainer/n_bat",true,false).Value
	emit_signal("j1_config", [n])
	get_tree().change_scene("res://Memoria.tscn")
