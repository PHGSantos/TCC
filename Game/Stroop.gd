extends Node2D

var grid
var answer
var etapa
var possible_colors
var words
var colors
var tipo_teste
var nome_teste
var current = 0
var maximum = 112

#TIPOS DE TESTE
#0 - teste inicial
#1 - com 4 cores apenas
#2 - com 112 cores
func _ready():
	possible_colors = Configuracoes.j2_cores_possiveis
	tipo_teste = Configuracoes.j2_tipo_teste
	nome_teste = Configuracoes.j2_nome_teste
	print(possible_colors)
	print(tipo_teste)
	print(nome_teste)
	etapa = 1
	answer = Array()
	words = Array()
	colors = Array()
	grid = get_node("grid")
	grid.rect_position = Vector2(300,300)
	setSceneUI()
	setSceneColors()
	setSceneLabels()

func setSceneUI():
	#test name
	get_node("texto").set_text(nome_teste)
	
	#button text
	get_node("PlayerArea/B1/Label").set_text(possible_colors[0])
	get_node("PlayerArea/B2/Label").set_text(possible_colors[1])
	get_node("PlayerArea/B3/Label").set_text(possible_colors[2])
	get_node("PlayerArea/B4/Label").set_text(possible_colors[3])

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
	for i in range(0,4,1):
		words.append(possible_colors[i])
		if (i == 0):
			colors.append(possible_colors[1])
		elif(i == 1):
			colors.append(possible_colors[2])
		elif(i == 2):
			colors.append(possible_colors[3])
		else:
			colors.append(possible_colors[0])

func testeTipo2():
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
	
	#print('etapa: '+str(etapa))
	#print('words['+str(current)+'] = '+words[current])
	#print('colors['+str(current)+'] = '+colors[current])
	#clear_console()
	#current+=1

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
		var i = 0
		while i < qtd:
			var label = Label.new()
			label.set_text(words[i])
			var cor = Helper.translateColor(colors[i])
			label.set("custom_colors/font_color", cor)
			label.set("custom_fonts/font", dynamic_font)
			grid.add_child(label)
			i+=1
	else:
		var label = Label.new()
		label.set_text(words[current])
		var cor = Helper.translateColor(colors[current])
		label.set("custom_colors/font_color", cor)
		label.set("custom_fonts/font", dynamic_font)
		grid.add_child(label)
		current+=1


func finishTest():
	var gabarito
	var qtd
	if(nome_teste == "Reconhecimento de Cores"):
		gabarito = possible_colors.duplicate()
		qtd = 4
		compareAnswer(qtd, gabarito) 
	elif(nome_teste == "Tutorial: Leitura de Cores"):
		gabarito = words.duplicate()
		qtd = 4
		compareAnswer(qtd, gabarito)
	elif(nome_teste == "Tutorial: Nomeação de Cores"):
		gabarito = colors.duplicate()
		qtd = 4
		compareAnswer(qtd, gabarito)
	elif(nome_teste == "Leitura de Cores"):
		gabarito = words.duplicate()
		qtd = answer
		analizeAnswer(qtd, gabarito)
	else:
		gabarito = colors.duplicate()
		qtd = 112
		analizeAnswer(qtd, gabarito)

func compareAnswer(var qtd, var gabarito):
	for i in range (0, qtd, 1):
		if(answer[i] != gabarito[i]):
			return false
	
	return true
	
func analizeAnswer(var qtd, var gabarito):
	var hits = 0
	var errors = 0
	for i in range (0, qtd, 1):
		if(answer[i] != gabarito[i]):
			errors+=1
		else:
			hits+=1
	var time = 112
	var total_answers = answer.size()
	var results = [time, total_answers, errors, hits]
	return results

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
	
	var max_etapa
	if(tipo_teste == 0 or tipo_teste == 1):
		max_etapa = 5
	else:
		max_etapa = 113
		
	etapa += 1
	if (etapa == max_etapa):
		get_node("PlayerArea/lab/etapa").set_text("OK!")
		finishTest()
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
