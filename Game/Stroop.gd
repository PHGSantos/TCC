extends Node2D

var back
var word
var grid
var answer
var etapa

func _ready():
	etapa = 1
	answer = Array()
	grid = get_node("grid")
	grid.rect_position = Vector2(300,300)
	setColors()

#black = (0,0,0)
#blue = (0,0,1)
#green = (0,1,0)
#pink = (1, 0.75, 0.8)
#red = (1,0,0)
#voilet = Color(0.93, 0.51, 0.93)
#white = Color(1, 1, 1)
#yellow = Color( 1, 1, 0) 

func setColors():
	#font settings
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://OpenDyslexic/OpenDyslexicAlta-Bold.otf")
	dynamic_font.size = 64
	
	#label settings
	var label1 = Label.new()
	label1.set_text("Preto")
	label1.set("custom_colors/font_color", Color(0,0,0))
	
	var label2 = Label.new()
	label2.set_text("Azul")
	label2.set("custom_colors/font_color", Color(0,0,1))
	
	var label3 = Label.new()
	label3.set_text("Verde")
	label3.set("custom_colors/font_color", Color(0,1,0))
	
	var label4 = Label.new()
	label4.set_text("Rosa")
	label4.set("custom_colors/font_color", Color(1,0.75,0.8))
	
	label1.set("custom_fonts/font", dynamic_font)
	label2.set("custom_fonts/font", dynamic_font)
	label3.set("custom_fonts/font", dynamic_font)
	label4.set("custom_fonts/font", dynamic_font)
	grid.add_child(label1)
	grid.add_child(label2)
	grid.add_child(label3)
	grid.add_child(label4)

func checkAnswer():
	if (answer.size() == 4):
		if (answer[0] == "PRETO") and (answer[0] == "AZUL") and (answer[0] == "VERDE") and (answer[0] == "ROSA"):
			return true
		else:
			return false


func _on_B1_pressed():
	updateScene("B1")

func _on_B2_pressed():
	updateScene("B2")

func _on_B3_pressed():
	updateScene("B3")

func _on_B4_pressed():
	updateScene("B4")

func updateScene(var button):
	var s = get_node("PlayerArea/"+button+"/Label").get_text()
	answer.append(s)
	etapa += 1
	if (etapa == 5):
		get_node("PlayerArea/lab/etapa").set_text("OK!")
	else:
		get_node("PlayerArea/lab/etapa").set_text(str(etapa)+"/4")
