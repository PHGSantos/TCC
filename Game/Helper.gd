extends Node

var deck = Array()
var study_set = Array()
var other_set = Array()

func _ready():
	
	pass

func get_random_number(from, to):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(from,to)
	#print(str(my_random_number))
	return my_random_number

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

func translateColor(v):
	match v:
		"PRETO":
			return Color(0,0,0)
		"AZUL":
			return Color(0,0,1)
		"VERDE":
			return Color(0,1,0)
		"ROSA":
			return Color(1,0.75,0.8)
		"VERMELHO":
			return Color(1,0,0)
		"VIOLETA":
			return Color(0.93,0.51,0.93)
		"BRANCO":
			return Color(1,1,1)
		"AMARELO":
			return Color(1,1,0)
		"MARROM":
			return Color(0.65,0.16,0.16)
		"CINZA":
			return Color(0.75,0.75,0.75)

func fillLetterDeck(var size):
	while deck.size() < size:
		var n = get_random_number(1,25)
		var letra = translateNumberToLetter(n)
		deck.append(letra)
		#print(letra)
	return deck

func fillImageDecks(var size):
	var arr = Array()
	
	var i = 1
	while(i <= size):
		arr.append(i)
		i+=1
	
	arr.shuffle()
	var half = size%2
	var a = arr.slice(0, half-1)
	var b = arr.slice(half, size-1)
	#print(a)
	#print(b)

func checkIfArrayIsUnique(myArray) :
	for i in range(0, myArray.size(),1): 
		for j in range(0, myArray.size(), 1): 
			if (i != j): 
				if (myArray[i] == myArray[j]): 
					return false; # means there are duplicate values
	return true; # means there are no duplicate values

func get_resized_texture(t: Texture, width: int = 0, height: int = 0):
	var image = t.get_data()
	if width > 0 && height > 0:
		image.resize(width, height)
	var itex = ImageTexture.new()
	itex.create_from_image(image)
	return itex	
