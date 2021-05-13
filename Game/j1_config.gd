extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")

func _ready():
	get_node("VBoxContainer/HBoxContainer/n_bat").value = Configuracoes.j1_qtd_baterias
	get_node("VBoxContainer/HBoxContainer2/n_let").value = Configuracoes.j1_qtd_letras_bateria
	get_node("VBoxContainer/HBoxContainer3/tempo").value = Configuracoes.j1_tempo_exibicao
	
	
func _on_Comecar_pressed():
	sprite1.modulate = Color(0.5,0.5,0.5)
	
	var configuracoes = get_node("/root/Configuracoes")
	var n = get_node("VBoxContainer/HBoxContainer/n_bat").value
	var l = get_node("VBoxContainer/HBoxContainer2/n_let").value
	var t = get_node("VBoxContainer/HBoxContainer3/tempo").value
		
	Configuracoes.set_j1_qtd_baterias(n)
	Configuracoes.set_j1_qtd_letras_bateria(l)
	Configuracoes.set_j1_tempo_exibicao(t)
	
	get_tree().change_scene("res://Conners.tscn")

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
