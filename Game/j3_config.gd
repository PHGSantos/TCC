extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_img").value = Configuracoes.j3_qtd_imagens
	get_node("VBoxContainer/HBoxContainer2/categoria").value = Configuracoes.j3_categoria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j3_tempo_exibicao


func _on_Comecar_pressed():
	sprite1.modulate = Color(0.5,0.5,0.5)
	
	var configuracoes = get_node("/root/Configuracoes")
	var i = get_node("VBoxContainer/HBoxContainer/n_img").value
	var c = get_node("VBoxContainer/HBoxContainer2/categoria").value
	var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		
	Configuracoes.set_j2_qtd_palavras(i)
	Configuracoes.set_j2_qtd_cores(c)
	Configuracoes.set_j2_tempo_exibicao(t)
	
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
