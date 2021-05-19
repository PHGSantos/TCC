extends Node2D

onready var sprite1 = get_node("Comecar/Sprite")
onready var sprite2 = get_node("Voltar/Sprite")
var popup

func _ready():
	get_node("ItemList").set_visible(false)
	pass


func _on_Voltar_pressed():
	get_tree().change_scene("res://MenuPrincipal.tscn")

func _on_B0_pressed():
	Configuracoes.set_j2_cores_possiveis([])
	Configuracoes.set_j2_tipo_tiste(0)
	Configuracoes.set_j2_nome_teste("Reconhecimento de Cor")
	get_tree().change_scene("res://Stroop.tscn")

func _on_B1_pressed():
	Configuracoes.set_j2_cores_possiveis([])
	Configuracoes.set_j2_tipo_tiste(1)
	Configuracoes.set_j2_nome_teste("Tutorial (Leitura de Cores)")
	get_tree().change_scene("res://Stroop.tscn")

func _on_B2_pressed():
	Configuracoes.set_j2_cores_possiveis([])
	Configuracoes.set_j2_tipo_tiste(1)
	Configuracoes.set_j2_nome_teste("Tutorial (Nomeação de Cores)")
	get_tree().change_scene("res://Stroop.tscn")

func _on_B3_pressed():
	Configuracoes.set_j2_cores_possiveis([])
	Configuracoes.set_j2_tipo_tiste(2)
	Configuracoes.set_j2_nome_teste("Leitura de Cores")
	get_tree().change_scene("res://Stroop.tscn")


func _on_B4_pressed():
	Configuracoes.set_j2_cores_possiveis([])
	Configuracoes.set_j2_tipo_tiste(2)
	Configuracoes.set_j2_nome_teste("Nomeação de Cores")
	get_tree().change_scene("res://Stroop.tscn")

func _on_MenuButton_pressed():
	get_node("ItemList").set_visible(true)
	pass
