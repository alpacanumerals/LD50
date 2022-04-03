extends Card
class_name Struck

const card_name: String = "struck"
const texture: StreamTexture = preload("res://assets/verb/struck.png")

const action: bool = true
const adventure: bool = true

func _init(new_id):
    id = new_id
