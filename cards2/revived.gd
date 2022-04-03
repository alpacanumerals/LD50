extends Card
class_name Revived

const card_name: String = "revived"
const texture: StreamTexture = preload("res://assets/verb/revived.png")

const action: bool = true
const adventure: bool = false
const targetanimate: bool = true

func _init(new_id):
    id = new_id
