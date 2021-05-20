extends Node2D

var current_game
var result
onready var screen = get_node(".")
onready var grid = get_node("grid")
var dynamic_font

func _ready():
	
	dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://OpenDyslexic/OpenDyslexicAlta-Bold.otf")
	dynamic_font.size = 30
	
	if(Configuracoes.current_game == 1):
		result = PlayerResults.j1_result
		displayResultsJ1()
	
	elif(Configuracoes.current_game == 2):
		result = PlayerResults.j2_result
		print(result)
		displayResultsJ1()
	
	elif(Configuracoes.current_game == 3):
		result = PlayerResults.j3_result
		displayResultsJ1()
	
	else:
		print("Que jogo é esse?!")

func displayResultsJ1():
	
	pass


func displayResultsJ2():
	var label1 = Label.new()
	label1.set_text("Tempo de jogo (seg.): "+str(result[0]))
	label1.set("custom_fonts/font", dynamic_font)
	
	var label2 = Label.new()
	label2.set_text("Total de cores respondidas: "+str(result[1]))
	label2.set("custom_fonts/font", dynamic_font)
	
	var label3 = Label.new()
	label3.set_text("Total de acertos: "+str(result[2]))
	label3.set("custom_fonts/font", dynamic_font)
	
	var label4 = Label.new()
	label4.set_text("Tempo de erros: "+str(result[3]))
	label4.set("custom_fonts/font", dynamic_font)
	
	grid.add_child(label1)
	grid.add_child(label2)
	grid.add_child(label3)
	grid.add_child(label4)


func displayResultsJ3():
	pass
