extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")

export  (NodePath)  var dropdown_path
onready var dropdown = get_node(dropdown_path)
var test_names

func _ready():
	test_names = ["Tutorial: CPT", "CPT"]
	add_items()
	get_node("VBoxContainer/HBoxContainer/n_bat").value = Configuracoes.j1_qtd_baterias
	get_node("VBoxContainer/HBoxContainer2/n_let").value = Configuracoes.j1_qtd_letras_bateria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j1_tempo_exibicao
	#dropdown.connect("item_selected", dropdown, "_on_item_selected")

func add_items():
	for test_name in test_names:
		dropdown.add_item(test_name)
	
	dropdown.select(0) #default

func _on_Comecar_pressed():
	Configuracoes.set_current_game(1)
	
	if(dropdown.get_selected_id() == 0):
		var n = get_node("VBoxContainer/HBoxContainer/n_bat").value
		var l = get_node("VBoxContainer/HBoxContainer2/n_let").value
		var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		var t2 = get_node("VBoxContainer/HBoxContainer4/limite").value
		Configuracoes.set_j1_qtd_baterias(n)
		Configuracoes.set_j1_qtd_letras_bateria(l)
		Configuracoes.set_j1_tempo_exibicao(t)
		Configuracoes.set_j1_tempo_limite(t2)
		get_tree().change_scene("res://TutorialCPT.tscn")
	else:
		get_tree().change_scene("res://CPT.tscn")

func _on_Voltar_pressed():
	get_tree().change_scene("res://MenuPrincipal.tscn")

func _on_item_selected(id):
	if(dropdown.get_selected_id() == 0):
		showSettings(true)
	else:
		showSettings(false)

func showSettings(var b):
	var arr = ["VBoxContainer/HBoxContainer", "VBoxContainer/HBoxContainer2",
	"VBoxContainer/HBoxContainer3","VBoxContainer/HBoxContainer4"]
	for path in arr:
		var parent = get_node(path)
		for child in parent.get_children(): 
			child.set_visible(b)
	print('ok')



func _on_dropdown_item_selected(index):
	if(index == 0):
		showSettings(true)
	else:
		showSettings(false)
