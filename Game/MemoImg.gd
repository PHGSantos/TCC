extends TextureRect

class_name MemoImg

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

func _init(var v, var width, var height):
	value = v
	face = load('res://Memo/'+str(value)+'.png')
	face = get_resized_texture(face,width,height)
	self.texture = face
