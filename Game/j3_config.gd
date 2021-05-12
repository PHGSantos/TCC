extends Node2D

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_img").value = Configuracoes.j3_qtd_imagens
	get_node("VBoxContainer/HBoxContainer2/categoria").value = Configuracoes.j3_categoria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j3_tempo_exibicao
	
	
func _on_Comecar_pressed():
	get_node("Comecar/Sprite").modulate.r = 0.5
	get_node("Comecar/Sprite").modulate.g = 0.5
	get_node("Comecar/Sprite").modulate.b = 0.5
	
	var configuracoes = get_node("/root/Configuracoes")
	var i = get_node("VBoxContainer/HBoxContainer/n_img").value
	var c = get_node("VBoxContainer/HBoxContainer2/categoria").value
	var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		
	Configuracoes.set_j2_qtd_palavras(i)
	Configuracoes.set_j2_qtd_cores(c)
	Configuracoes.set_j2_tempo_exibicao(t)
	
	get_tree().change_scene("res://TOMM.tscn")
	
