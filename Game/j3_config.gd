extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")
var study_set
var other_set
var test_names
export  (NodePath)  var dropdown_path
onready var dropdown = get_node(dropdown_path)
var selected
var error = false 

func _ready():
	test_names = ["Tutorial: TOMM", "TOMM"]
	add_items()
	get_node("VBoxContainer/HBoxContainer/n_img").value = Configuracoes.j3_qtd_imagens
	study_set = Array()
	other_set = Array()

func add_items():
	for test_name in test_names:
		dropdown.add_item(test_name)
	
	dropdown.select(0) #default
	selected = 'Tutorial:TOMM'


func _on_Comecar_pressed():
	
	var n
	if(dropdown.get_selected_id() == 0):#tutorial
		n = get_node("VBoxContainer/HBoxContainer/n_img").value
	else:#TOMM
		n = 100
		
	createImageSets(n)
	
	if(error == false):
		Configuracoes.set_j3_qtd_imagens(n)
		Configuracoes.set_j3_stage(1)
		Configuracoes.set_current_game(3)
		get_tree().change_scene("res://TOMM.tscn")


func _on_Voltar_pressed():
	get_tree().change_scene("res://MenuPrincipal.tscn")

func createImageSets1(var size):
	var arr = Array()
	var n = 1
	while (n <= size):
		arr.append(n)
		n = n + 1
	randomize()
	arr.shuffle()
	
	var half = size/2
	study_set = arr.slice(0,half-1)
	other_set = arr.slice(half, size-1)
	
	randomize()
	Configuracoes.set_j3_study_set(study_set)
	randomize()
	Configuracoes.set_j3_other_set(other_set)
	Configuracoes.set_j3_tipo(selected)
	
func createImageSets(var total_imgs):
	var path = 'res://outlined_imgs/'
	var array = Helper.list_files_in_directory(path)
	#garantindo numero par de imagens no vetor
	if(array.size() < total_imgs):
		error = true;
		get_node("erro").set_text('A pasta outlined_imgs deve ter pelo menos '+str(total_imgs)+' imagens')
		get_node("erro").set_visible(error)
	else:
		error = false
		get_node("erro").set_visible(error)
		
		if(array.size()%2 != 0): # se tiver size impar tira o ultimo
			array.pop_back()
		
		randomize()
		array.shuffle()
		
		array = array.slice(0,total_imgs-1)
		
		var half = total_imgs/2
		study_set = array.slice(0,half-1)
		other_set = array.slice(half, total_imgs-1)
		
		randomize()
		Configuracoes.set_j3_study_set(study_set)
		randomize()
		Configuracoes.set_j3_other_set(other_set)
		Configuracoes.set_j3_tipo(selected)

func _on_dropdown_item_selected(index):
	if(index == 0):
		showSettings(true)
		selected = "Tutorial: TOMM"
		var files=Helper.list_files_in_directory("res://outlined_imgs")
		
	else:
		showSettings(false)
		selected = "TOMM"

func showSettings(var b):
	var arr = ["VBoxContainer/HBoxContainer"]
	for path in arr:
		var parent = get_node(path)
		for child in parent.get_children(): 
			child.set_visible(b)
	
