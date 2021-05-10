extends Button

func _on_Voltar_mouse_entered():
	$Sprite.modulate.r = 0.7
	$Sprite.modulate.g = 0.7
	$Sprite.modulate.b = 0.7


func _on_Voltar_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1


func _on_Voltar_pressed():
	$Sprite.modulate.r = 0.5
	$Sprite.modulate.g = 0.5
	$Sprite.modulate.b = 0.5
	get_tree().change_scene("res://MenuPrincipal.tscn")


func _on_Comecar_mouse_entered():
	pass # Replace with function body.
