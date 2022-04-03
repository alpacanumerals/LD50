extends Card
class_name Despised

const card_name: String = "despised"
const texture: StreamTexture = preload("res://assets/verb/despised.png")

const action: bool = true
const adventure: bool = false

func _init(new_id):
    id = new_id
