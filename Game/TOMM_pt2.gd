extends Node2D

onready var timer = get_node("Timer")
onready var changeImage = get_node("changeImage")
onready var sec = get_node("PlayerArea/seg") 
onready var minute = get_node("PlayerArea/min")
var displayValueSec = 0
var displayValueMin  = 0
var changer
onready var tempo_limite = Configuracoes.j3_tempo_limite
var points = 0
onready var study = Configuracoes.j3_study_set.duplicate()
onready var other = Configuracoes.j3_other_set.duplicate()
var images

func _ready():
	images = get_node("Images")
	updateImageQueue()
	timer.set_wait_time(1)
	timer.start()
	#changeImage.set_wait_time(1)
	#changeImage.start()

func updateImageQueue():
	var a = study.pop_front()
	var b = other.pop_front()
	display_images(a,b)
	changer = 0

func display_images(var a, var b):
	if (images.get_child_count() > 0):
		for child in images.get_children():
			child.queue_free()

	var img1 = MemoImg.new(a, 50, 50)
	var img2 = MemoImg.new(b, 50, 50)
	images.add_child(img1)
	images.add_child(img2)
	img1.set_name('img1')
	img2.set_name('img2')
	img1.set_position(Vector2(500,150),false)
	img2.set_position(Vector2(1000,150),false)

func imageTrigger(var curr_Value, var ref_value, var interval):
	if((curr_Value - ref_value) == interval):
		return true
	else:
		return false;

func _on_Yes_pressed():
	#if(letra.value == 'X'):
	#	points+=1
	#	get_node("PlayerArea/qtd_pts").set_text(str(points))
	updateImageQueue()

func _on_No_pressed():
	#if(letra.value != 'X'):
	#	points+=1
	#	get_node("PlayerArea/qtd_pts").set_text(str(points))
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
	#if(changer==tempo_exibicao):
	#	updateImageQueue()
