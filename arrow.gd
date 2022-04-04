extends Sprite

var wavelength = 0.8
var counter = 0

func _process(delta):
    counter += delta
    if counter > wavelength:
        visible = !visible
        counter = 0
