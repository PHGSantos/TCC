extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Comecar_pressed():
	#$Sprite.modulate.r = 0.5
	#$Sprite.modulate.g = 0.5
	#$Sprite.modulate.b = 0.5
	var n = get_tree().get_root.Value
	print(n)
	emit_signal("j1_config")
	get_tree().change_scene("res://Memoria.tscn")
