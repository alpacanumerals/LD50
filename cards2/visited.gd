extends Card
class_name Visited

const card_name: String = "visited"
const texture: StreamTexture = preload("res://assets/verb/visited.png")

const action: bool = true
const adventure: bool = false
const targetanimate: bool = false

func _init(new_id):
    id = new_id
