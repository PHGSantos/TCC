extends Node

#?
onready var Memoria = get_node('/root/Memoria/')
var cardBack = preload('res://letter_tiles/PNG/Blue/letter.png')
var deck = Array()
var rng = RandomNumberGenerator.new()

func _ready():
#	fillDeck()
#	dealDeck()
	pass

func get_random_numbers(from, to, how_many):
	var arr = Array()
	for i in range(from,to):
		arr.append(i)
		print(i)
	arr.shuffle()
	#arr.resize(how_many)
	return arr

func translateNumberToLetter(v):
	if v == 1 :
		return 'A'
	elif v == 2:
		return 'B'	
	elif v == 3:
		return 'C'
	elif v == 4:
		return 'D'
	elif v == 5:
		return 'E'
	elif v == 6:
		return 'F'
	elif v == 7:
		return 'G'
	elif v == 8:
		return 'H'
	elif v == 9:
		return 'I'
	elif v == 10:
		return 'J'
	elif v == 11:
		return 'K'
	elif v == 12:
		return 'L'
	elif v == 13:
		return 'M'
	elif v == 14:
		return 'N'
	elif v == 15:
		return 'O'
	elif v == 16:
		return 'P'
	elif v == 17:
		return 'Q'
	elif v == 18:
		return 'R'
	elif v == 19:
		return 'S'
	elif v == 20:
		return 'T'
	elif v == 21:
		return 'U'
	elif v == 22:
		return 'V'
	elif v == 23:
		return 'W'
	elif v == 24:
		return 'X'
	elif v == 25:
		return 'Y'
	elif v == 26:
		return 'Z'
	else:
		return '$'	

func fillDeck():
	var n = 0
	var max_n = 10
	var arr = get_random_numbers(1,26, max_n)#dentre as 26, escolhe n_max
	#print(arr.size()+1)
	while n <=  arr.size():
		var letra = translateNumberToLetter(arr[n-1])
		deck.append(Letra.new('Blue','letter_'+letra))
		print(letra +'-'+ str(arr[n-1]))
		n = n + 1
	

func dealDeck():
	var n = 0
	if deck.empty() == false:
		while n < deck.size():  
#			Memoria.get_node('grid').add_child(deck[n-1])
			n = n + 1
	else:
		print('ERROR: DECK IS EMPTY (MemoriaController.gd)')		
