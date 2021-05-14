extends TextureRect

class_name Letra

var color
var value
var face

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

func _init(var c, var v, var width, var height):
	color = c
	value = v
	face = load('res://letter_tiles/PNG/'+c+'/'+value+'.png')
	face = get_resized_texture(face,width,height)
	self.texture = face
