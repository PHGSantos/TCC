extends Node

#configurações J1
var j1_qtd_baterias:int = 8
var j1_qtd_letras_bateria:int = 10
var j1_tempo_exibicao:int = 12 

#configurações J2
var j2_qtd_palavras:int = 3
var j2_qtd_cores:int = 6
var j2_tempo_exibicao:int = 2

#configurações J3
var j3_qtd_imagens:int = 10
var j3_categoria:int = 1
var j3_tempo_exibicao:int = 4

func _ready():
	pass # Replace with function body.

func set_j1_qtd_baterias(var n):
	self.j1_qtd_baterias = n

func set_j1_qtd_letras_bateria(var l):
	self.j1_qtd_letras_bateria = l
	
func set_j1_tempo_exibicao(var t):
	self.j1_tempo_exibicao = t

func set_j2_qtd_palavras(var p):
	self.j2_qtd_palavras = p

func set_j2_qtd_cores(var c):
	self.j2_qtd_cores = c
	
func set_j2_tempo_exibicao(var t):
	self.j2_tempo_exibicao = t

func set_j3_qtd_imagens(var i):
	self.j3_qtd_imagens = i

func set_j3_categoria(var c):
	self.j3_categoria = c
	
func set_j3_tempo_exibicao(var t):
	self.j3_tempo_exibicao = t
