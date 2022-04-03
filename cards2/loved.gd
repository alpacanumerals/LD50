extends Card
class_name Loved

const card_name: String = "loved"
const texture: StreamTexture = preload("res://assets/verb/loved.png")

const action: bool = true
const adventure: bool = false

func _init(new_id):
    id = new_id
