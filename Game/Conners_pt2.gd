extends Node2D

onready var timer = get_node("Timer")
onready var changeImage = get_node("changeImage")
onready var sec = get_node("PlayerArea/seg") 
onready var minute = get_node("PlayerArea/min")
var displayValueSec = 0
var displayValueMin  = 0
var changer
var letra
onready var qtd_bateria = Configuracoes.j1_qtd_baterias
#onready var qtd_letras = Configuracoes.j1_qtd_letras_bateria
onready var qtd_letras = 2
onready var tempo_exibicao = Configuracoes.j1_tempo_exibicao
var hits = 0
var errors = 0
var omission_errors = 0
var letter_queue
var letra_alvo = 'X'
var bateria_Atual
var contador = 0
var time_start = 0
var time_now = 0

func _ready():
	bateria_Atual = 1
	updateBateria(bateria_Atual)
	updateImageQueue()
	timer.set_wait_time(1)
	timer.start()

func updateImageQueue():
	display_letra(letter_queue.pop_front())

func display_letra(var l):
	letra = Letra.new('Blue','letter_'+l,300,300)
	letra.set_name('Letra')
	letra.set_position(Vector2(500,150),false)
	add_child(letra)
	contador+=1
	if(contador == 3):
		contador = 1
	get_node("PlayerArea/letra/p_num").set_text(str(contador)+"/"+str(qtd_letras)) 
	time_start = OS.get_unix_time()

func updateBateria(var n):
	#reseta as letras
	letter_queue = Helper.fillLetterDeck(qtd_letras)
	#muda a label da bateria
	get_node("PlayerArea/bateria/b_num").set_text(str(n))

func _on_Timer_timeout():
	displayValueSec+=1
	if(displayValueSec < 10):
		sec.set_text('0'+str(displayValueSec))
	else:
		#sec.set_text(str(displayValueSec))
		if(displayValueSec <= 59):
			sec.set_text(str(displayValueSec))
			#displayValueMin+=1
			if(displayValueMin < 10):
				minute.set_text('0'+str(displayValueMin))
			else:
				minute.set_text(str(displayValueMin))
		else:
			displayValueMin+=1
			displayValueSec = 0
			sec.set_text(str(displayValueSec))
			if(displayValueMin < 10):
				minute.set_text('0'+str(displayValueMin))
			else:
				minute.set_text(str(displayValueMin))
	
	if (getElapsedTime() == tempo_exibicao):
		checkGameState("timer")

func getElapsedTime():
	time_now = OS.get_unix_time()
	var time_elapsed = time_now - time_start
	return time_elapsed

func _input(ev):
	if Input.is_key_pressed(KEY_SPACE):
		checkGameState("button")
		

func checkGameState(var source):
	if(letter_queue.empty()):
		bateria_Atual += 1
		if(bateria_Atual > qtd_bateria):
			get_tree().change_scene("res://Results.tscn")
		else:
			updateBateria(bateria_Atual)
	else:
		checkAnswer(source)
		updateImageQueue()
		
func checkAnswer(var source):
	if(source == "button"):
		if(letra.value != letra_alvo):
			hits+=1
		else:
			errors+=1
	elif(source == "timer"):
		if(letra.value == letra_alvo):
			hits+=1
		else:
			errors+=1
			omission_errors+=1
