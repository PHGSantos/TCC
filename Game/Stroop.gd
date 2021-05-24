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
var tempo = 10#120
var max_tempo =10#120


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
	
	#timer e grid
	if(tipo_teste == 2):
		grid.queue_free()
		
		var label = Label.new()
		label.set_name('LabelCor')
		label.set_position(Vector2(500,300))
		get_node(".").add_child(label)
		
		get_node("PlayerArea/lab2").set_visible(true)
		get_node("PlayerArea/lab2/tempo").set_visible(true)
		get_node("PlayerArea/lab2/tempo").set_text(str(tempo))
		get_node("PlayerArea/lab2/tempo/Timer").set_wait_time(1)
		get_node("PlayerArea/lab2/tempo/Timer").start()


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
	
	if ((tipo_teste == 0) or (tipo_teste == 1)):
		multiLabel(dynamic_font)
	else:
		singleLabel(dynamic_font)
		
	
func multiLabel(var dynamic_font):
	var qtd = words.size()#4
	var i = 0
	while i < qtd:
		var label = Label.new()
		label.set_text(words[i])
		var cor = Helper.translateColor(colors[i])
		label.set("custom_colors/font_color", cor)
		label.set("custom_fonts/font", dynamic_font)
		grid.add_child(label)
		i+=1

func singleLabel(var dynamic_font):
	var label = get_node('LabelCor') 
	label.set_text(words[current])
	
	var cor = Helper.translateColor(colors[current])
	label.set("custom_colors/font_color", cor)
	label.set("custom_fonts/font", dynamic_font)
	#get_node(".").add_child(label)
	current+=1

func finishTest():
	var gabarito
	var qtd
	var result = [0,0,0,0]
	if(nome_teste == "Reconhecimento de Cores"):
		gabarito = possible_colors.duplicate()
		qtd = 4
		result = analizeAnswer(qtd, gabarito)
		PlayerResults.set_j2_result(result)
		get_tree().change_scene("res://j2_config.tscn")
		 
	elif(nome_teste == "Tutorial: Leitura de Cores"):
		gabarito = words.duplicate()
		qtd = 4
		result = analizeAnswer(qtd, gabarito)
		PlayerResults.set_j2_result(result)
		get_tree().change_scene("res://j2_config.tscn")
		
	elif(nome_teste == "Tutorial: Nomeação de Cores"):
		gabarito = colors.duplicate()
		qtd = 4
		result = analizeAnswer(qtd, gabarito)
		PlayerResults.set_j2_result(result)
		get_tree().change_scene("res://j2_config.tscn")
		
	elif(nome_teste == "Leitura de Cores"):
		gabarito = words.duplicate()
		qtd = answer.size()
		result = analizeAnswer(qtd, gabarito)
		PlayerResults.set_j2_result(result)
		get_tree().change_scene("res://Results.tscn")
	elif(nome_teste == "Nomeação de Cores"):
		gabarito = colors.duplicate()
		qtd = answer.size()
		result = analizeAnswer(qtd, gabarito)
		PlayerResults.set_j2_result(result)
		get_tree().change_scene("res://Results.tscn")
	else:
		print("teste inexistente")
		
		

func compareAnswer(var qtd, var gabarito):
	for i in range (0, qtd, 1):
		if(answer[i] != gabarito[i]):
			return true
	
	return true
	
func analizeAnswer(var qtd, var gabarito):
	var hits = 0
	var errors = 0
	for i in range (0, qtd, 1):
		if(answer[i] != gabarito[i]):
			errors+=1
		else:
			hits+=1
	
	var tempo_de_jogo
	if(tipo_teste == 0 or tipo_teste == 1):
		tempo_de_jogo =  "sem limite de tempo"
	else:
		tempo_de_jogo =  max_tempo - tempo  
	
	var total_answers = answer.size()
	var results = [tempo_de_jogo, total_answers, hits, errors]
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
		etapa += 1
		if (etapa == 5):
			get_node("PlayerArea/lab/etapa").set_text("OK!")
			finishTest()
		else:
			get_node("PlayerArea/lab/etapa").set_text(str(etapa)+"/4")
	else:
		etapa +=1
		max_etapa = 113
		if (etapa == max_etapa):
			get_node("PlayerArea/lab/etapa").set_text("OK!")
			finishTest()
		else:
			if(tempo != 0):
				setSceneColors()
				setSceneLabels()
			else:
				finishTest()

func _on_Timer_timeout():
	tempo -= 1
	get_node("PlayerArea/lab2/tempo").set_text(str(tempo))
	if(tempo == 0):
		get_node("PlayerArea/lab2/tempo/Timer").stop()
		finishTest()
