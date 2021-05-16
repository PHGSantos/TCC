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
onready var qtd_letras = Configuracoes.j1_qtd_letras_bateria
onready var tempo_exibicao = Configuracoes.j1_tempo_exibicao
var points = 0
onready var letter_queue = Helper.fillLetterDeck(qtd_letras*qtd_bateria)

func _ready():
	updateImageQueue()
	timer.set_wait_time(1)
	timer.start()
	changeImage.set_wait_time(1)
	changeImage.start()

func updateImageQueue():
	display_letra(letter_queue.pop_front())
	changer = 0

func display_letra(var l):
	letra = Letra.new('Blue','letter_'+l,300,300)
	letra.set_name('Letra')
	letra.set_position(Vector2(500,150),false)
	add_child(letra)

func imageTrigger(var curr_Value, var ref_value, var interval):
	if((curr_Value - ref_value) == interval):
		return true
	else:
		return false;

func _on_Yes_pressed():
	if(letra.value == 'X'):
		points+=1
		get_node("PlayerArea/qtd_pts").set_text(str(points))
	updateImageQueue()

func _on_No_pressed():
	if(letra.value != 'X'):
		points+=1
		get_node("PlayerArea/qtd_pts").set_text(str(points))
	updateImageQueue()

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

func _on_changeImage_timeout():
	changer+=1
	if(changer==tempo_exibicao):
		updateImageQueue()
