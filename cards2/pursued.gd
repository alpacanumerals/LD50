extends Card
class_name Pursued

const card_name: String = "pursued"
const texture: StreamTexture = preload("res://assets/verb/pursued.png")

const action: bool = true
const adventure: bool = true
const targetanimate: bool = true

func _init(new_id):
    id = new_id
