extends Node2D

var deck = Array()
var displayValue = 10
onready var timer = get_node("Countdown")
onready var display = get_node("PlayerArea/display")
var increase = false

func _ready():
	listImages()
	displayAllImages()
	timer.set_wait_time(1)
	timer.start()
	

func listImages():
	var n = 1
	while (n <= 30):
		deck.append(MemoImg.new(n,115,130))
		n = n + 1
	pass

func displayAllImages():
	var n = 0
	if deck.empty() == false:
		while n < deck.size():  
			get_node("grid").add_child(deck[n])
			n = n + 1
	else:
		print('ERROR: DECK IS EMPTY (MemoriaController.gd)')		

func resetScene():
	deleteNode("PlayerArea/texto")
	deleteNode("grid")

func deleteNode(var tree_path):
	var node = get_node(tree_path)
	if(is_instance_valid(node)):
		node.queue_free()


func _on_Countdown_timeout():
	if (displayValue == 0):
		increase = true
		get_tree().change_scene("res://Conners_pt2.tscn")
		#resetScene()
		
	if(increase == false):
		displayValue -= 1
	else:
		displayValue += 1
		
	display.set_text(str(displayValue))
