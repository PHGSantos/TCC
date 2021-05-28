extends Node2D

onready var sprite1 = get_node("J1/Sprite")
onready var sprite2 = get_node("J2/Sprite")
onready var sprite3 = get_node("J3/Sprite")

func _on_J1_pressed():
	sprite1.modulate = Color(0.5,0.5,0.5)
	get_tree().change_scene("res://J1_config.tscn")

func _on_J1_mouse_entered():
	sprite1.modulate = Color(0.9,0.9,0.9)


func _on_J1_mouse_exited():
	sprite1.modulate = Color(1,1,1)

func _on_J2_pressed():
	sprite2.modulate = Color(0.5,0.5,0.5)
	get_tree().change_scene("res://j2_config.tscn")

func _on_J2_mouse_entered():
	sprite2.modulate = Color(0.9,0.9,0.9)

func _on_J2_mouse_exited():
	sprite2.modulate = Color(1,1,1)

func _on_J3_pressed():
	sprite3.modulate = Color(0.5,0.5,0.5)
	get_tree().change_scene("res://j3_config.tscn")

func _on_J3_mouse_entered():
	sprite3.modulate = Color(0.9,0.9,0.9)

func _on_J3_mouse_exited():
	sprite3.modulate = Color(1,1,1)

func _on_Sair_pressed():
	get_tree().quit()
