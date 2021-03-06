extends Node2D

onready var timer = get_node("Timer")
onready var changeImage = get_node("changeImage")
onready var sec = get_node("PlayerArea/seg") 
onready var minute = get_node("PlayerArea/min")
var displayValueSec = 0
var displayValueMin  = 0
#onready var tempo_limite = Configuracoes.j3_tempo_limite
var img_number = 1
var study
var other
var images
var gabarito
var answers = Array()
var errors = 0
var hits = 0

func _ready():
	set_process_input(true)
	shuffleSets()
	gabarito = Array()
	images = get_node("Images")
	updateImageQueue()
	timer.set_wait_time(1)
	timer.start()

func shuffleSets():
	study = Configuracoes.j3_study_set.duplicate()
	other = Configuracoes.j3_other_set.duplicate()
	randomize()
	study.shuffle()
	randomize()
	other.shuffle()

func updateImageQueue():
	if(study.empty() or other.empty()):
		var result = analizeAnswer();
		if(Configuracoes.j3_stage == 1):
			PlayerResults.set_j3_result_etapa1(result)
			#get_tree().change_scene("res://Results.tscn")
		elif(Configuracoes.j3_stage == 2):
			PlayerResults.set_j3_result_etapa2(result)
		else:
			PlayerResults.set_j3_result_retencao(result)
		
		#if(Configuracoes.j3_tipo == "TOMM"):
		get_tree().change_scene("res://Results.tscn")
		#else:
		#	get_tree().change_scene("res://j3_config.tscn")
	else:	
		var a = study.pop_front()
		var b = other.pop_front()
		if(a == null or b == null):
			printerr('null element in the image sets')
		else:
			display_images(a,b)

func analizeAnswer():
	for i in range (0,gabarito.size(),1):
		if(answers[i] == gabarito[i]):
			hits+=1
		else:
			errors+=1

	var total_etapas = hits + errors
	var minutes = str(displayValueMin)
	var seconds = str(displayValueSec)
	if(displayValueMin < 10):
		minutes = "0"+minutes
	if(displayValueSec < 10):
		seconds = "0"+seconds
	var used_time = str(minutes)+":"+str(seconds)
	var result = [total_etapas, used_time, hits, errors]
	
	return result


func display_images(var a, var b):
	get_node("PlayerArea/qtd_pts").set_text(str(img_number))
	img_number+=1
	if (images.get_child_count() > 0):
		for child in images.get_children():
			child.queue_free()

	var img1 = MemoImg.new(a, 300, 300)
	var img2 = MemoImg.new(b, 300, 300)
	img1.set_name('img1')
	img2.set_name('img2')
	var pos_esquerda = Vector2(300,200)
	var pos_direita = Vector2(700,200)
	images.add_child(img1)
	images.add_child(img2)
	
	var rng = Helper.get_random_number(0,10)
	if(rng%2==0): ##se o rng for par study:esq other:dir
		img1.set_position(pos_esquerda,false)
		img2.set_position(pos_direita,false)
		gabarito.append("Esquerda")
	else: ##se o rng for impar study:dir other:esq
		img1.set_position(pos_direita,false)
		img2.set_position(pos_esquerda,false)
		gabarito.append("Direita")
		

func imageTrigger(var curr_Value, var ref_value, var interval):
	if((curr_Value - ref_value) == interval):
		return true
	else:
		return false;

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

#check project>settings>input map
func _input(ev):
	if (ev.is_action_pressed('ui_left')):
		answers.append("Esquerda")
		updateImageQueue()
	elif (ev.is_action_pressed('ui_right')):
		answers.append("Direita")
		updateImageQueue()
