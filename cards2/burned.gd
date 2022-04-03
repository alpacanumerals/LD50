extends Card
class_name Burned

const card_name: String = "burned"
const texture: StreamTexture = preload("res://assets/verb/burned.png")

const action: bool = false
const adventure: bool = false
const targetanimate: bool = false

func _init(new_id):
    id = new_id
