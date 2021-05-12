extends Node2D

var deck = Array()

func _ready():
	#print(Configuracoes.j1_qtd_baterias)
	#print(Configuracoes.j1_qtd_letras_bateria)
	#print(Configuracoes.j1_tempo_exibicao)
	listLetters()
	displayAllLetters()

func listLetters():
	var n = 1
	while (n <= 26):
		var letra = translateNumberToLetter(n)
		deck.append(Letra.new('Blue','letter_'+letra))
		print(letra +'-'+ str(n))
		n = n + 1
	pass

func displayAllLetters():
	var n = 0
	if deck.empty() == false:
		while n < deck.size():  
			get_node("grid").add_child(deck[n])
			n = n + 1
	else:
		print('ERROR: DECK IS EMPTY (MemoriaController.gd)')		

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
