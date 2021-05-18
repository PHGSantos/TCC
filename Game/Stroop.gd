extends Node2D

var grid
var answer
var etapa
var possible_colors = ["CINZA", "AZUL", "VERDE", "ROSA"]
var words
var colors
var tipo_teste
var current = 0
var maximum = 112

#TIPOS DE TESTE
#0 - teste inicial
#1 - com 4 cores apenas
#2 - com 112 cores
func _ready():
	tipo_teste = 0
	etapa = 1
	answer = Array()
	words = Array()
	colors = Array()
	grid = get_node("grid")
	grid.rect_position = Vector2(300,300)
	setSceneColors()
	setSceneLabels()

func setSceneColors():
	if(tipo_teste == 0):
		testeTipo0()
	elif(tipo_teste == 1):
		testeTipo1()
	else:
		testeTipo2()

func testeTipo0():
	var i = 0
	while i < 4:
		words.append("XXXX")
		i+=1
	colors = possible_colors.duplicate()

func testeTipo1():
	for i in range(0,3,1):
		words[i] = possible_colors[i]
		if (i == 0):
			colors[i] = possible_colors[1]
		elif(i == 1):
			colors[i] = possible_colors[2]
		elif(i == 2):
			colors[i] = possible_colors[3]
		else:
			colors[i] = possible_colors[0]
	pass

func testeTipo2():
	var rng
	var arr
	var w
	var c
	var i = 0
	while i < 112:
		arr = possible_colors.duplicate()
		
		rng = Helper.get_random_number(0,3)
		w = arr[rng]
		arr.remove(rng)
		words.append(w)

		rng = Helper.get_random_number(0,2)
		c = arr[rng]
		arr.remove(rng)
		colors.append(c)
		
		print('words['+str(i)+'] = '+words[i])
		print('colors['+str(i)+'] = '+colors[i])
		i+=1

func testeTipo20():
	var rng
	var arr
	var w
	var c
	
	arr = possible_colors.duplicate()
	
	rng = Helper.get_random_number(0,3)
	w = arr[rng]
	arr.remove(rng)
	words.append(w)

	rng = Helper.get_random_number(0,2)
	c = arr[rng]
	arr.remove(rng)
	colors.append(c)
	
	print('words['+str(current)+'] = '+words[current])
	print('colors['+str(current)+'] = '+colors[current])
	current+=1

func setSceneLabels():
	#font settings
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://OpenDyslexic/OpenDyslexicAlta-Bold.otf")
	dynamic_font.size = 64
	
	#label settings
	#print('words ='+str(words.size()))
	#print('colors ='+str(colors.size()))
	
	var qtd
	if ((tipo_teste == 0) or (tipo_teste == 1)):
		qtd = words.size()#4
	else:
		qtd = 1
		
	var i = 0
	while i < qtd:
		var label = Label.new()
		label.set_text(words[i])
		label.set("custom_colors/font_color", colors[i])
		label.set("custom_fonts/font", dynamic_font)
		grid.add_child(label)
		i+=1

func checkAnswer():
	if (answer.size() == 4):
		if (answer[0] == "VERDE") and (answer[0] == "AZUL") and (answer[0] == "CINZA") and (answer[0] == "ROSA"):
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

#black = (0,0,0)
#blue = (0,0,1)
#green = (0,1,0)
#pink = (1, 0.75, 0.8)
#red = (1,0,0)
#voilet = Color(0.93, 0.51, 0.93)
#white = Color(1, 1, 1)
#yellow = Color( 1, 1, 0) 
#brown = Color( 0.65, 0.16, 0.16)
#gray = Color( 0.75, 0.75, 0.75) 
