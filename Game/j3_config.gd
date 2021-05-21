extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")
var study_set
var other_set

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_img").value = Configuracoes.j3_qtd_imagens
	study_set = Array()
	other_set = Array()

func _on_Comecar_pressed():
	sprite1.modulate = Color(0.5,0.5,0.5)
	
	var n = get_node("VBoxContainer/HBoxContainer/n_img").value
	Configuracoes.set_j3_qtd_imagens(n)
	Configuracoes.set_j3_stage(1)
	Configuracoes.set_current_game(3)
	createImageSets(n)
	get_tree().change_scene("res://TOMM.tscn")


func _on_Comecar_mouse_entered():
	sprite1.modulate = Color(0.7,0.7,0.7)


func _on_Comecar_mouse_exited():
	sprite1.modulate = Color(1,1,1)

func _on_Voltar_pressed():
	sprite2.modulate = Color(0.5,0.5,0.5)
	get_tree().change_scene("res://MenuPrincipal.tscn")

func _on_Voltar_mouse_entered():
	sprite2.modulate = Color(0.7,0.7,0.7)


func _on_Voltar_mouse_exited():
	sprite2.modulate = Color(1,1,1)

func createImageSets(var size):
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
	
	#print(study_set)
	#print(other_set)
	
	randomize()
	Configuracoes.set_j3_study_set(study_set)
	randomize()
	Configuracoes.set_j3_other_set(other_set)
