extends Node2D

onready var timer = get_node("Timer")
onready var changeImage = get_node("changeImage")
onready var sec = get_node("PlayerArea/seg") 
onready var minute = get_node("PlayerArea/min")
var displayValueSec = 0
var displayValueMin  = 0
var changer
var letra
#onready var qtd_bateria = 18
#onready var qtd_letras = 20
#onready var tempo_exibicao = 2
onready var qtd_bateria = 2
onready var qtd_letras = 3
onready var tempo_exibicao = 4
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
	set_process_input(true)
	bateria_Atual = 1
	updateBateria(bateria_Atual)
	updateImageQueue()
	timer.set_wait_time(1)
	timer.start()

func updateImageQueue():
	display_letra(letter_queue.pop_front())

func display_letra(var l):
	letra = Letra.new(l,300,300)
	letra.set_name('Letra')
	letra.set_position(Vector2(500,150),false)
	add_child(letra)
	contador+=1
	if(contador == qtd_letras+1):
		contador = 1
	get_node("PlayerArea/letra/p_num").set_text(str(contador)+"/"+str(qtd_letras)) 
	time_start = OS.get_unix_time()

func updateBateria(var n):
	var path = 'res://letter_tiles/PNG/Blue/'
	var array = Helper.list_files_in_directory(path)
	randomize()
	array.shuffle()
	letter_queue = array.slice(0, qtd_letras-1, 1, false)
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
	if ev.is_action_pressed('ui_select'):
		checkGameState("button")
		

func checkGameState(var source):
	if(letter_queue.empty()):
		bateria_Atual += 1
		if(bateria_Atual > qtd_bateria):
			var tempo_de_jogo = get_played_time()
			var result = [tempo_de_jogo, hits, errors, omission_errors]
			PlayerResults.set_j1_result(result)
			get_tree().change_scene("res://Results.tscn")
		else:
			updateBateria(bateria_Atual)
			updateImageQueue()
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

func get_played_time():
	var s = displayValueSec
	var m = displayValueMin
	if(s < 10):
		s = "0"+str(displayValueSec)
	if(m < 10):
		m = "0"+str(displayValueMin)
	return m+":"+s
