extends Card
class_name Turned_Into

const card_name: String = "turned into"
const texture: StreamTexture = preload("res://assets/verb/turned_into.png")

const action: bool = false
const adventure: bool = false
const targetanimate: bool = false

func _init(new_id):
    id = new_id
