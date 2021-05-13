extends Node2D


func _ready():
	display_letra()

func display_letra():
	var l = 'A'
	var letra = Letra.new('Blue','letter_'+l,92,130)
	letra.set_name('Letra')
	letra.set_position(Vector2(300,300),false)
	add_child(letra)
