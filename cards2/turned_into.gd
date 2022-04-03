extends Card
class_name Turned_Into

const card_name: String = "turned into"
const texture: StreamTexture = preload("res://assets/verb/turned_into.png")

const action: bool = true
const adventure: bool = false

func _init(new_id):
    id = new_id
