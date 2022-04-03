extends Card
class_name Found

const card_name: String = "found"
const texture: StreamTexture = preload("res://assets/verb/found.png")

const action: bool = true
const adventure: bool = true

func _init(new_id):
    id = new_id
