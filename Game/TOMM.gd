extends Node2D

var study_set_copy
var other_set_copy
onready var timer = get_node("timer")
onready var disp1 = get_node("PlayerArea/disp1")
onready var disp2 = get_node("PlayerArea/disp2")
var qtd_imagens
var current = 1
onready var img = get_node("img")

func _ready():
	qtd_imagens = Configuracoes.j3_qtd_imagens
	study_set_copy = Configuracoes.j3_study_set.duplicate()
	other_set_copy = Configuracoes.j3_other_set.duplicate()
	img.set_position(Vector2(300,300))
	timer.set_wait_time(3)
	timer.start()

func displayImage():
	#update image
	#print("study["+str(current-1)+"]")
	if (current-1 < study_set_copy.size()): #por alguma razão ele faz uma iteração a mais
		var v = study_set_copy[current-1]
		var face = load('res://Memo/'+str(v)+'.png')
		face = Helper.get_resized_texture(face,50,50)
		img.texture = face
	
	#update counter
		updateCounter()
	
		current +=1

func updateCounter():
	disp1.set_text(str(current))
	disp2.set_text("/"+str(qtd_imagens/2))
	disp1.set_visible(true)
	disp2.set_visible(true)

func _on_timer_timeout():
	if (current > qtd_imagens/2):
		get_tree().change_scene("res://TOMM_pt2.tscn")

	displayImage()
		
	#displayImage()
