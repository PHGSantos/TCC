extends Control

export  (NodePath)  var dropdown_path
onready var dropdown = get_node(dropdown_path)

export  (NodePath)  var dropdown_c1_path
onready var dropdown_c1 = get_node(dropdown_c1_path)

export  (NodePath)  var dropdown_c2_path
onready var dropdown_c2 = get_node(dropdown_c2_path)

export  (NodePath)  var dropdown_c3_path
onready var dropdown_c3 = get_node(dropdown_c3_path)

export  (NodePath)  var dropdown_c4_path
onready var dropdown_c4 = get_node(dropdown_c4_path)

var test_names
var all_colors

func _ready():
	test_names = ["Reconhecimento de Cor", 
	"Tutorial: Leitura de Cores", "Tutorial: Nomeação de Cores",
	"Leitura de Cores", "Nomeação de Cores"]
	
	all_colors = ["CINZA","AZUL","VERDE","ROSA",
	"VERMELHO","VIOLETA","BRANCO","AMARELO" ,"MARROM","PRETO" ]
	
	add_items()

func add_items():
	#dropdown.connect('item_selected', self, 'on_item_selected')
	for test_name in test_names:
		dropdown.add_item(test_name)
	
	var arr_1 = [dropdown_c1, dropdown_c2, dropdown_c3, dropdown_c4]
	for element in arr_1:
		for cor in all_colors:
			element.add_item(cor)
	
	set_default(dropdown, 0)
	set_default(dropdown_c1, 0)
	set_default(dropdown_c2, 1)
	set_default(dropdown_c3, 2)
	set_default(dropdown_c4, 3)

func remove_item(var id):
	dropdown.remove_item(id)

func disable_item(id):
	dropdown.set_item_disabled(id, true)

func set_default(var d, id):
	d.select(id)

func _on_Voltar_pressed():
	get_tree().change_scene("res://MenuPrincipal.tscn")

#func on_item_selected(id):
#	print(str(dropdown.get_item_text(id)))
	
#d é qualquer um dos dropdown	
func get_selected_item(var d):
	var id = d.get_selected()
	return d.get_item_text(id)

func _on_Comecar_pressed():
	var selected = get_selected_item(dropdown) 
	Configuracoes.set_j2_nome_teste(selected)
	
	if(selected == test_names[0]):
		Configuracoes.set_j2_tipo_teste(0)
	elif(selected == test_names[1] or selected == test_names[2]):
		Configuracoes.set_j2_tipo_teste(1)
	else:
		Configuracoes.set_j2_tipo_teste(2)
	
	var c1 = get_selected_item(dropdown_c1)
	var c2 = get_selected_item(dropdown_c2)
	var c3 = get_selected_item(dropdown_c3)
	var c4 = get_selected_item(dropdown_c4)
	var possible_colors =[c1, c2, c3, c4]
	
	if(Helper.checkIfArrayIsUnique(possible_colors)):
		Configuracoes.set_j2_cores_possiveis(possible_colors)
		get_tree().change_scene("res://Stroop.tscn")
	else:
		get_node("aviso_erro").set_visible(true)
		get_node("aviso_erro/Timer").set_wait_time(5)
		get_node("aviso_erro/Timer").start()
	


func _on_Timer_timeout():
	get_node("aviso_erro").set_visible(false)
