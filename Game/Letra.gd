extends TextureRect

class_name Letra

var file_name
var face
var value 

func _ready():
	pass

func get_resized_texture(t: Texture, width: int = 0, height: int = 0):
	var image = t.get_data()
	if width > 0 && height > 0:
		image.resize(width, height)
	var itex = ImageTexture.new()
	itex.create_from_image(image)
	return itex	

func modulate_texture(it:ImageTexture, var r, var g, var b):
	it.modulate(r,g,b)

func _init(var p, var width, var height):
	file_name = p
	var aux = p.split('.',true,1)
	value = aux[0]
	face = load('res://letter_tiles/PNG/Blue/'+file_name)
	face = get_resized_texture(face,width,height)
	self.texture = face
