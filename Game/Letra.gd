extends TextureRect

class_name Letra

var color
var value
var face
#var back

func _ready():
	pass
	
func get_resized_texture(t: Texture, width: int = 0, height: int = 0):
	var image = t.get_data()
	if width > 0 && height > 0:
		image.resize(width, height)
	var itex = ImageTexture.new()
	itex.create_from_image(image)
	return itex	
	
func _init(var c, var v):
	color = c
	value = v
	#face = load('res://letter_tiles/PNG/'+color+'/'+value+'.png')
	face = load('res://letter_tiles/PNG/Box/'+value+'.png')
	#back = MemoriaController.cardBack
	#set_size(Vector2(20,20))
	face = get_resized_texture(face,92,130)
	self.texture = face	
	#set_normal_texture(face)
	
	
