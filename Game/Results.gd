extends Node2D

var current_game
var result
onready var screen = get_node(".")
onready var grid = get_node("grid")
var dynamic_font
var retencao
var date
var time
const FILE_PATH = "res://Saved Files/"

func _ready():
	get_datetime()
	
	dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://OpenDyslexic/OpenDyslexicAlta-Bold.otf")
	dynamic_font.size = 30
	
	if(Configuracoes.current_game == 1):
		result = PlayerResults.j1_result
		displayResultsJ1()
	
	elif(Configuracoes.current_game == 2):
		result = PlayerResults.j2_result
		displayResultsJ2()
	
	elif(Configuracoes.current_game == 3):
		displayResultsJ3()
	
	else:
		print("Que jogo é esse?!")

func get_datetime():
	var t = OS.get_datetime()
	date = str(t["year"])+'/'+str(t["month"])+'/'+str(t["day"])
	time = str(t["hour"])+':'+str(t["minute"])+':'+str(t["second"])

func displayResultsJ1():
	get_node("nome_do_jogo").set_text(Configuracoes.j1_tipo)
	if(Configuracoes.j1_tipo == 'CPT'):
		get_node("Salvar").set_visible(true)
	
	var label1 = Label.new()
	label1.set_text("Tempo de jogo (seg.): "+str(result[0]))
	label1.set("custom_fonts/font", dynamic_font)
	
	var label2 = Label.new()
	label2.set_text("Total de acertos: "+str(result[1]))
	label2.set("custom_fonts/font", dynamic_font)
	
	var label3 = Label.new()
	label3.set_text("Total de erros: "+str(result[2]))
	label3.set("custom_fonts/font", dynamic_font)
	
	var label4 = Label.new()
	label4.set_text("Total de erros por omissão: "+str(result[3]))
	label4.set("custom_fonts/font", dynamic_font)
	
	grid.add_child(label1)
	grid.add_child(label2)
	grid.add_child(label3)
	grid.add_child(label4)

func displayResultsJ2():
	get_node("nome_do_jogo").set_text(Configuracoes.j2_nome_teste)
	
	if(Configuracoes.j2_tipo_teste == 2):
		get_node("Salvar").set_visible(true)

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
	label4.set_text("Total de erros: "+str(result[3]))
	label4.set("custom_fonts/font", dynamic_font)
	
	grid.add_child(label1)
	grid.add_child(label2)
	grid.add_child(label3)
	grid.add_child(label4)

func displayResultsJ3():
	get_node("nome_do_jogo").set_text(Configuracoes.j3_tipo)
	
	if(Configuracoes.j3_tipo == 'TOMM'):
		get_node("Salvar").set_visible(true)
	
	var stage = Configuracoes.j3_stage
	if(stage == 1):
		result = PlayerResults.j3_result_etapa1
		get_node("Inicio/label").set_text("Etapa 2")
	elif(stage == 2):
		result = PlayerResults.j3_result_etapa2
		if(isRetencao() == true):
			get_node("Retencao").set_visible(true)
	elif(stage == 3):
		result = PlayerResults.j3_result_retencao
		get_node("Retencao").set_visible(false)
	else:
		print("?????")	
	
	var label0 = Label.new()
	if(stage == 3):
		label0.set_text("Etapa atual: "+str("Rentenção"))
	else:
		label0.set_text("Etapa atual: "+str(stage))
	label0.set("custom_fonts/font", dynamic_font)

	var label1 = Label.new()
	label1.set_text("Total de Respostas: "+str(result[0]))
	label1.set("custom_fonts/font", dynamic_font)
	
	var label2 = Label.new()
	label2.set_text("Tempo de conclusão: "+str(result[1]))
	label2.set("custom_fonts/font", dynamic_font)
	
	var label3 = Label.new()
	label3.set_text("Total de acertos: "+str(result[2]))
	label3.set("custom_fonts/font", dynamic_font)
	
	var label4 = Label.new()
	label4.set_text("Total de erros: "+str(result[3]))
	label4.set("custom_fonts/font", dynamic_font)
	
	grid.add_child(label0)
	grid.add_child(label1)
	grid.add_child(label2)
	grid.add_child(label3)
	grid.add_child(label4)

func isRetencao():
	var r1 = PlayerResults.j3_result_etapa1.duplicate()
	var r2 = PlayerResults.j3_result_etapa2.duplicate()
	
	var total_imgs = Configuracoes.j3_qtd_imagens
	if((r1[2]+r2[2]) >= 0.44*total_imgs):
		return false
	else:
		return  true

func updateConfig(var settings, var test):
	var c = settings[test].save_number
	c+=1
	settings[test].save_number = c
	save(settings, 'res://Saved Files/config.json')

func _on_Salvar_pressed():
	var settings = load_file()
	var FILE_NAME
	var count
	var content = ''
	if(Configuracoes.current_game == 1):
		FILE_NAME = settings['CPT'].file_name+str(settings['CPT'].save_number);
		content = { 
		"Game": {
			"test_name": "Conners Performance Test (CPT3)",
			"date_time": date + ' at ' + time,
			"playing_time": result[0],
			"hits": result[1],
			"errors": result[2],
			"omission_errors": result[3]
			}
		}
		save(content, FILE_PATH+FILE_NAME+'.json')
		updateConfig(settings, 'CPT')
	
	elif(Configuracoes.current_game == 2):
		FILE_NAME = settings['STROOP'].file_name+str(settings['STROOP'].save_number);
		content = {
		"Game": {
			"test_name": "Teste de Stroop",
			"date_time": date + ' at ' + time,
			"playing_time": result[0],
			"hits": result[1],
			"errors": result[2],
			"omission_errors": result[3]
			}
		}
		save(content, FILE_PATH+FILE_NAME+'.json')
		updateConfig(settings, 'STROOP')
	else:
		FILE_NAME = settings['TOMM'].file_name+str(settings['TOMM'].save_number);
		content = {
		"Game": {
			"test_name": "Test Of Memory Malingering",
			"date_time": date + ' at ' + time,
			"playing_time": result[0],
			"hits": result[1],
			"errors": result[2],
			"omission_errors": result[3]
			}
		}
		save(content, FILE_PATH+FILE_NAME+'.json')
		updateConfig(settings, 'TOMM')

func save(var content, var FILE_NAME):
	
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(content))
	file.close()

func load_file():
	var content
	var FILE_NAME = "res://Saved Files/config.json";
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			content = data
			
			return content
		else:
			
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")

func _on_Inicio_pressed():
	if (Configuracoes.j3_stage == 1): #volta pro estudo p/ etapa 2
		Configuracoes.set_j3_stage(2)
		get_tree().change_scene("res://TOMM.tscn")
	else:	
		get_tree().change_scene("res://MenuPrincipal.tscn")

func _on_Retencao_pressed():
	Configuracoes.set_j3_stage(3)
	get_tree().change_scene("res://TOMM_pt2.tscn")

