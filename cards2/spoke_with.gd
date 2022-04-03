extends Card
class_name Spoke_With

const card_name: String = "spoke with"
const texture: StreamTexture = preload("res://assets/verb/spoke_with.png")

const action: bool = true
const adventure: bool = false
const targetanimate: bool = true

func _init(new_id):
    id = new_id
