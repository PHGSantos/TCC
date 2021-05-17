extends Node2D

var study_set
var other_set
var displayValue = 10
onready var timer = get_node("Countdown")
onready var display = get_node("PlayerArea/display")
var increase = false
var size = Configuracoes.j3_qtd_imagens

func _ready():
	createImageSets(size)
	displayAllImages()
	timer.set_wait_time(1)
	timer.start()
	

func createImageSets(var size):
	var arr = Array()
	var n = 1
	while (n <= size):
		arr.append(n)
		n = n + 1
	randomize()
	arr.shuffle()
	
	var half = size/2
	study_set = arr.slice(0,half-1)
	other_set = arr.slice(half, size-1)
	
	print(study_set)
	print(other_set)
	
	Configuracoes.set_j3_study_set(study_set)
	Configuracoes.set_j3_other_set(other_set)

func displayAllImages():
	var n = 0
	var size = study_set.size()
	var arr = study_set.duplicate()
	if study_set.empty() == false:
		while n < size:  
			var v = arr.pop_front()
			var img = MemoImg.new(v, 50, 50)
			get_node("grid").add_child(img)
			n = n + 1
	else:
		print('ERROR: STUDY SET IS EMPTY')		


func _on_Countdown_timeout():
	if (displayValue == 0):
		increase = true
		get_tree().change_scene("res://TOMM_pt2.tscn")
		#resetScene()
		
	if(increase == false):
		displayValue -= 1
	else:
		displayValue += 1
		
	display.set_text(str(displayValue))
