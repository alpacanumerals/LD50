extends Card
class_name Fell_Upon

const card_name: String = "fell upon"
const texture: StreamTexture = preload("res://assets/verb/fell_upon.png")

const action: bool = false
const adventure: bool = false

func _init(new_id):
    id = new_id
