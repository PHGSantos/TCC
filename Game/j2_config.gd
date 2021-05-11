extends Node2D

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_pal").value = Configuracoes.j1_qtd_baterias
	get_node("VBoxContainer/HBoxContainer2/n_cor").value = Configuracoes.j1_qtd_letras_bateria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j1_tempo_exibicao
	
	
func _on_Comecar_pressed():
	get_node("Comecar/Sprite").modulate.r = 0.5
	get_node("Comecar/Sprite").modulate.g = 0.5
	get_node("Comecar/Sprite").modulate.b = 0.5
	
	var configuracoes = get_node("/root/Configuracoes")
	var p = get_node("VBoxContainer/HBoxContainer/n_pal").value
	var c = get_node("VBoxContainer/HBoxContainer2/n_cor").value
	var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		
	Configuracoes.set_j2_qtd_palavras(p)
	Configuracoes.set_j2_qtd_cores(c)
	Configuracoes.set_j2_tempo_exibicao(t)
	
	get_tree().change_scene("res://Scoop.tscn")
	
