extends Node2D

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_bat").value = Configuracoes.j1_qtd_baterias
	get_node("VBoxContainer/HBoxContainer2/n_let").value = Configuracoes.j1_qtd_letras_bateria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j1_tempo_exibicao
	
	
func _on_Comecar_pressed():
	get_node("Comecar/Sprite").modulate.r = 0.5
	get_node("Comecar/Sprite").modulate.g = 0.5
	get_node("Comecar/Sprite").modulate.b = 0.5
	
	var configuracoes = get_node("/root/Configuracoes")
	var n = get_node("VBoxContainer/HBoxContainer/n_bat").value
	var l = get_node("VBoxContainer/HBoxContainer2/n_let").value
	var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		
	Configuracoes.set_j1_qtd_baterias(n)
	Configuracoes.set_j1_qtd_letras_bateria(l)
	Configuracoes.set_j1_tempo_exibicao(t)
	
	get_tree().change_scene("res://Conners.tscn")
	
