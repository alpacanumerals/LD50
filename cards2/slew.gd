extends Card
class_name Slew

const card_name: String = "slew"
const texture: StreamTexture = preload("res://assets/verb/slew.png")

const action: bool = true
const adventure: bool = true
const targetanimate: bool = true

func _init(new_id):
    id = new_id
