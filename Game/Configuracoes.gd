extends Node

#configurações J1
var j1_qtd_baterias:int = 8
var j1_qtd_letras_bateria:int = 10
var j1_tempo_exibicao:int = 12 

#configurações J2
var j2_qtd_palavras
var j2_qtd_cores
var j2_tempo_exibicao

#configurações J3
var j3_qtd_imagens
var j3_categoria
var j3_tempo_exibicao

func _ready():
	pass # Replace with function body.

func set_j1_qtd_baterias(var n):
	self.j1_qtd_baterias = n

func set_j1_qtd_letras_bateria(var l):
	self.j1_qtd_letras_bateria = l
	
func set_j1_tempo_exibicao(var t):
	self.j1_tempo_exibicao = t
