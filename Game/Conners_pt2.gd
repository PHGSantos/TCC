extends Node2D

onready var timer = get_node("Timer")
onready var changeImage = get_node("changeImage")
onready var sec = get_node("PlayerArea/seg") 
onready var minute = get_node("PlayerArea/min")
var displayValueSec = 0
var displayValueMin  = 0

var changer = 0
var tempo_exibicao = 4

func _ready():
	display_letra('A')
	timer.set_wait_time(1)
	timer.start()
	changeImage.set_wait_time(1)
	changeImage.start()

func display_letra(var l):
	var letra = Letra.new('Blue','letter_'+l,92,130)
	letra.set_name('Letra')
	letra.set_position(Vector2(300,300),false)
	add_child(letra)

func imageTrigger(var curr_Value, var ref_value, var interval):
	if((curr_Value - ref_value) == interval):
		return true
	else:
		return false;

func _on_Yes_pressed():
	pass # Replace with function body.


func _on_Yes_mouse_entered():
	pass # Replace with function body.


func _on_Yes_mouse_exited():
	pass # Replace with function body.


func _on_No_pressed():
	pass # Replace with function body.


func _on_No_mouse_entered():
	pass # Replace with function body.


func _on_No_mouse_exited():
	pass # Replace with function body.


func _on_Timer_timeout():
	displayValueSec+=1
	if(displayValueSec < 10):
		sec.set_text('0'+str(displayValueSec))
	else:
		sec.set_text(str(displayValueSec))
		if(displayValueSec == 60):
			displayValueMin+=1
			if(displayValueMin < 10):
				minute.set_text('0'+str(displayValueMin))
			else:
				minute.set_text(str(displayValueMin))


func _on_changeImage_timeout():
	changer+=1
	if(changer==tempo_exibicao):
		display_letra('B')
		changer = 0
