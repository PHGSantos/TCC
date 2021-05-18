extends Node

#configurações J1
var j1_qtd_baterias:int = 1
var j1_qtd_letras_bateria:int = 10
var j1_tempo_exibicao:int = 4 

#configurações J2
var j2_cores_possiveis = Array()
var j2_tipo_teste
var j2_nome_teste

#configurações J3
var j3_qtd_imagens:int = 30
var j3_tempo_limite:int = 5
var j3_study_set
var j3_other_set

func _ready():
	pass # Replace with function body.

func set_j1_qtd_baterias(var n):
	self.j1_qtd_baterias = n

func set_j1_qtd_letras_bateria(var l):
	self.j1_qtd_letras_bateria = l
	
func set_j1_tempo_exibicao(var t):
	self.j1_tempo_exibicao = t

func set_j2_cores_possiveis(var cores):
	self.j2_cores_possiveis = cores

func set_j2_tipo_tiste(var t):
	self.j2_tipo_teste = t
	
func set_j2_nome_teste(var n):
	self.j2_nome_teste = n

func set_j3_qtd_imagens(var i):
	self.j3_qtd_imagens = i

func set_j3_categoria(var c):
	self.j3_categoria = c
	
func set_j3_tempo_limite(var t):
	self.j3_tempo_limite = t

func set_j3_study_set(var ss):
	self.j3_study_set = ss
	
func set_j3_other_set(var os):
	self.j3_other_set = os
